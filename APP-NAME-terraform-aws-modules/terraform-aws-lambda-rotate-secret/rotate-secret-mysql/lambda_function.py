# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

import boto3
import json
import logging
import os
import pymysql
import datetime
import time

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    """Secrets Manager RDS MySQL Handler

    This handler uses the single-user rotation scheme to rotate an RDS MySQL user credential. This rotation scheme
    logs into the database as the user and rotates the user's own password, immediately invalidating the user's
    previous password.

    The Secret SecretString is expected to be a JSON string with the following format:
    {
        'engine': <required: must be set to 'mysql'>,
        'host': <required: instance host name>,
        'username': <required: username>,
        'password': <required: password>,
        'dbname': <optional: database name>,
        'port': <optional: if not specified, default port 3306 will be used>
    }

    Args:
        event (dict): Lambda dictionary of event parameters. These keys must include the following:
            - SecretId: The secret ARN or identifier
            - ClientRequestToken: The ClientRequestToken of the secret version
            - Step: The rotation step (one of createSecret, setSecret, testSecret, or finishSecret)

        context (LambdaContext): The Lambda runtime information

    Raises:
        ResourceNotFoundException: If the secret with the specified arn and stage does not exist

        ValueError: If the secret is not properly configured for rotation

        KeyError: If the secret json does not contain the expected keys

    """
    arn = event['SecretId']
    token = event['ClientRequestToken']
    step = event['Step']

    print("#---------------------------------------------------------------------------------")
    print("# Event: ",event)
    # Setup the client
    service_client = boto3.client('secretsmanager', endpoint_url=os.environ['SECRETS_MANAGER_ENDPOINT'])
    eb_client = boto3.client('elasticbeanstalk')

    # Set Lambda function environment variables
    aws_region = os.environ['REGION']
    eb_environment_name = os.environ['ELASTIC_BEANSTALK_ENVIRONMENT_NAME']
    enable_automatic_rotation = os.environ['ENABLE_AUTOMATIC_ROTATION']

    # Make sure EB is in healthy state
    elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)

    # Make sure the version is staged correctly
    metadata = service_client.describe_secret(SecretId=arn)
    if "RotationEnabled" in metadata and not metadata['RotationEnabled']:
        logger.error("Secret %s is not enabled for rotation" % arn)
        raise ValueError("Secret %s is not enabled for rotation" % arn)
    versions = metadata['VersionIdsToStages']
    if token not in versions:
        logger.error("Secret version %s has no stage for rotation of secret %s." % (token, arn))
        raise ValueError("Secret version %s has no stage for rotation of secret %s." % (token, arn))
    if "AWSCURRENT" in versions[token]:
        logger.info("Secret version %s already set as AWSCURRENT for secret %s." % (token, arn))
        return
    elif "AWSPENDING" not in versions[token]:
        logger.error("Secret version %s not set as AWSPENDING for rotation of secret %s." % (token, arn))
        raise ValueError("Secret version %s not set as AWSPENDING for rotation of secret %s." % (token, arn))

    # Call the appropriate step
    if step == "createSecret":
        print("#---------------------------------------------------------------------------------")
        print("# Step: 'createSecret")
        create_secret(service_client, arn, token)

    elif step == "setSecret":
        print("# Step: 'setSecret'")
        set_secret(service_client, arn, token)

    elif step == "testSecret":
        print("# Step: 'testSecret'")
        test_secret(service_client, arn, token)

    elif step == "finishSecret":
        print("# Step: 'finishSecret")
        finish_secret(service_client, arn, token)

        elastic_beanstalk_update_environment(eb_client, service_client, token, eb_environment_name, arn, aws_region)

        # Enable or disable automatic rotation after secret has been previously rotated
        # This way we can be sure that secret will not be automatically rotated if someone manually rotates the secret
        # that has automatic rotation disabled by default. Because after manually rotating the secret, automatic rotation
        # will be enabled. And we don't want to rotate secret from application database user because of downtime that could
        # happen afterwards
        if enable_automatic_rotation == "true":
          print("# Automatic rotation enabled")
        else:
          # Disable automatic rotation
          print("# Disabling automatic rotation")
          secret_cancel_automatic_rotate_secret(service_client, arn)

    else:
        logger.error("lambda_handler: Invalid step parameter %s for secret %s" % (step, arn))
        raise ValueError("Invalid step parameter %s for secret %s" % (step, arn))


def secret_cancel_automatic_rotate_secret(service_client, arn):
    """cancel automatic secret rotation

    This method will cancel automatic secret rotation. Because, when automatic secret rotation is enable, we actually don't know when rotation will happen.
    The automatic rotation can be set minmum to every day, but there is no option to define exact time window. We want to avoid any downtime that automatic rotation could cause.

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier
    """

    print("#---------------------------------------------------------------------------------")
    print("# Disabling automatic secret rotation - canceling secret rotation")
    response = service_client.cancel_rotate_secret(
        SecretId=arn
    )

def secret_get_tag_value(service_client, arn):
    """Get secret tag value

    This method will return the value of secret tag "Stack"

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier
    """

    secret = service_client.describe_secret(
        SecretId=arn
    )

    secret_tags_list = secret['Tags']

    for item in secret_tags_list:
        if item['Key'] == "Stack":
            # print(item.get("Value"))
            return item.get("Value")


def elastic_beanstalk_get_environment_variable_value_by_key(eb_client, eb_environment_name, env_var_key):
    """Get value from Elastic Beanstalk environment variable

    This method will return the value of Elastic Beanstalk environment variable

    Args:
        eb_client (client): The Elastic Beanstalk service client

        eb_environment_name (string): The name of Elastic Beanstalk environment from which we want to get environment variable
        value.

        env_var_key (string): The name of environment variable
    """

    # Describe Eleastic Beanstalk environment configuration, save response to list afterwards
    response = eb_client.describe_configuration_settings(
        ApplicationName=eb_environment_name,
        EnvironmentName=eb_environment_name,
    )

    eb = response['ConfigurationSettings'][0]['OptionSettings']

    # Declare empty list for saving the list of Elastic Banstalk environment variables
    eb_environment_variables_list = []

    # Loop through response, get environment variables
    for item in eb:
        for key, value in item.items():
            if key == "Namespace":
                if value == "aws:elasticbeanstalk:application:environment":
                    eb_environment_variables_list.append(item)

    # Lopp through environment variables and search for RDS_STACK value
    for item in eb_environment_variables_list:
        if env_var_key in item.values():
            # print(item.get("Value"))
            return item.get("Value")

def elastic_beanstalk_update_environment(eb_client, service_client, token, eb_environment_name, arn, aws_region):
    """Update Elastic Beanstalk environment

    This method will update Elastic Beanstalk environment after secret rotation has been finished. First it will set
    deployment policy to Rolling (in order to try and minimize any downtime), then it will update and set environment
    variable RDS_PASSWORD after which it will set deployment policy back to RollingWithAdditionalBatch.

    Args:
        eb_client (client): The Elastic Beanstalk service client

        service_client (client): The secrets manager service client

        token (string): The ClientRequestToken associated with the secret version

        eb_environment_name (string): The name of Elastic Beanstalk environment from which we want to get environment variable
        value.

        arn (string): The secret ARN or other identifier

        aws_region (string): The AWS region
    """

    current_dict = get_secret_dict(service_client, arn, "AWSCURRENT")
    db_username = current_dict['username']

    secret_rds_stack = secret_get_tag_value(service_client, arn)
    # ToDo: check if secret_rds_stack returns none - which means that EB has no RDS_STACK environment variable
    eb_rds_stack = elastic_beanstalk_get_environment_variable_value_by_key(eb_client, eb_environment_name, "RDS_STACK")

    print("# eb_rds_stack:", eb_rds_stack)
    print("# secret_rds_stack:", secret_rds_stack)

    if eb_rds_stack in secret_rds_stack:
        print("# Secret for which rotation has been requested is part of same RDS_STACK that's currently used and set in Elastic Beanstalk environemnt variables")
        print("# Checking secret database username. If username is other then 'APP-NAME', Elastic Beanstalk environemnt will not be updated after rotation")

        if db_username == "APP-NAME":
            print("# Rotating secret for username: 'APP-NAME'")
            print("# Elastic Beanstalk environment will be updated after secret rotation has finished")
            print("#---------------------------------------------------------------------------------")
            print("# Checking if Elastic Beanstalk is in 'Ready' state")
            # Make sure Elastic Beanstalk environment is in 'Ready' state
            elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)

            print("# Setting and updating Elastic Beanstalk deployment policy to: 'Rolling'")
            # Set Elastic Beanstalk deployment policy ro 'Rolling'
            elastic_beanstalk_set_deployment_policy(eb_client, eb_environment_name, 'Rolling')
            # Wait for environment to finish updating
            elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)

            print("# Waiting for Elastic Beanstalk to be 'Ready'")
            # Make sure Elastic Beanstalk environment is in 'Ready' state
            elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)

            print("# Updating Elastic Beanstalk environment variables")
            # Update Elastic Beanstalk environment variables
            elastic_beanstalk_update_environment_variables(eb_client, service_client, token, eb_environment_name, arn, aws_region)
            # Wait for environment to finish updating
            elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)
            print("# Environment update completed successfully.")

            print("# Set Elastic Beanstalk deployment policy back to: 'RollingWithAdditionalBatch'")
            # Set back deployment policy to 'RollingWithAdditionalBatch'
            elastic_beanstalk_set_deployment_policy(eb_client, eb_environment_name, 'RollingWithAdditionalBatch')
            # Wait for environment to finish updating
            elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name)
            print("# Environment update completed successfully.")
        else:
            print("# Rotating secret for user: %s. Elastic Beanstalk environment will not be updated." % (db_username))

    else:
        print("# Elastic Beanstalk environment and secret for which rotation is request are not part of same RDS_STACK")
        print("# Elastic Beanstalk will not be updatet automatically after secret rotation")

def elastic_beanstalk_wait_for_environment_ready_state(eb_client, eb_environment_name):
    """Wait for Elastic Beanstalk environment to be in ready state

    This method will check in which state is Elastic Beanstalk environment. If environment is in any state other then
    ready, this method will wait until state is changed so we can safely proceed to next update. If we try to perform
    update when Elastic Beanstalk is not in Ready state, Elastic Beanstalk will throw error

    Args:
        eb_client (client): The Elastic Beanstalk service client

        eb_environment_name (string): The name of Elastic Beanstalk environment from which we want to get environment variable
        value.
    """

    response = eb_client.describe_environments(
        EnvironmentNames=[
            eb_environment_name
        ],
    )

    # Valid states: 'Launching'|'Updating'|'Ready'|'Terminating'|'Terminated'
    eb_env_state = response['Environments'][0]['Status']

    while True:
        if(eb_env_state == "Ready"):
            eb_env_health = response['Environments'][0]['Health']
            eb_env_health_status = response['Environments'][0]['HealthStatus']
            print("Elastic Beanstalk environment state:", eb_env_state)
            print("Elastic Beanstalk environment health:", eb_env_health)
            print("Elastic Beanstalk environment health status:", eb_env_health_status)
            break

        print("Waiting for Elastic Beanstalk environment state to be ready. State:", eb_env_state)
        time.sleep(60)

        response = eb_client.describe_environments(
            EnvironmentNames=[
                eb_environment_name
            ],
        )

        eb_env_state = response['Environments'][0]['Status']
        eb_env_health = response['Environments'][0]['Health']
        eb_env_health_status = response['Environments'][0]['HealthStatus']


def elastic_beanstalk_update_environment_variables(eb_client, service_client, token, eb_environment_name, arn, aws_region):
    """Update Elastic Beanstalk environment variable

    This method will update Elastic Beanstalk environment variable and set new RDS_PASSWORD

    Args:
        eb_client (client): The Elastic Beanstalk service client

        service_client (client): The secrets manager service client

        token (string): The ClientRequestToken associated with the secret version

        eb_environment_name (string): The name of Elastic Beanstalk environment from which we want to get environment variable
        value.

        arn (string): The secret ARN or other identifier

        aws_region (string): The AWS region
    """

    now = datetime.datetime.now()

    print("# Starting with elasticbeanstalk environment update...")

    current_dict = get_secret_dict(service_client, arn, "AWSCURRENT", token)
    # password = "%s" % (current_dict['password'])

    # Start with Elastic Beanstalk environment update
    response = eb_client.update_environment(
        EnvironmentName =eb_environment_name,
        OptionSettings=[
            {
                'Namespace': 'aws:elasticbeanstalk:application:environment',
                'OptionName': 'SECRET_LAST_ROTATION',
                'Value': now.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")
            },
            {
                'Namespace': 'aws:elasticbeanstalk:application:environment',
                'OptionName': 'RDS_PASSWORD',
                'Value': "%s" % (current_dict['password'])
            }
        ]
    )


def elastic_beanstalk_set_deployment_policy(eb_client, eb_environment_name, deployment_policy):
    """Set Elastic Beanstalk deployment policy

    This method will set Elastic Beanstalk deployment to desired policy that we pass as parameter

    Args:
        eb_client (client): The Elastic Beanstalk service client

        eb_environment_name (string): The name of Elastic Beanstalk environment from which we want to get environment variable
        value.

        deployment_policy (string): The Elastic Beanstalk deployment policy. Valida values: Rolling | RollingWithAdditionalBatch | Immutable
    """

    print("# Starting with elasticbeanstalk deployment policy update to: ", deployment_policy)

    # Start with Elastic Beanstalk deplyoment policy update
    response = eb_client.update_environment(
        EnvironmentName=eb_environment_name,
        OptionSettings=[
            {
                'Namespace': 'aws:elasticbeanstalk:command',
                'OptionName': 'DeploymentPolicy',
                'Value': deployment_policy
            },
        ]
    )


def create_secret(service_client, arn, token):
    """Generate a new secret

    This method first checks for the existence of a secret for the passed in token. If one does not exist, it will generate a
    new secret and put it with the passed in token.

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier

        token (string): The ClientRequestToken associated with the secret version

    Raises:
        ValueError: If the current secret is not valid JSON

        KeyError: If the secret json does not contain the expected keys

    """
    # Make sure the current secret exists
    current_dict = get_secret_dict(service_client, arn, "AWSCURRENT")

    # Now try to get the secret version, if that fails, put a new secret
    try:
        get_secret_dict(service_client, arn, "AWSPENDING", token)
        logger.info("createSecret: Successfully retrieved secret for %s." % arn)
    except service_client.exceptions.ResourceNotFoundException:
        # Generate a random password
        passwd = service_client.get_random_password(ExcludeCharacters='><|)(;-$&´`/@"\'\\')
        current_dict['password'] = passwd['RandomPassword']

        # Put the secret
        service_client.put_secret_value(SecretId=arn, ClientRequestToken=token, SecretString=json.dumps(current_dict), VersionStages=['AWSPENDING'])
        logger.info("createSecret: Successfully put secret for ARN %s and version %s." % (arn, token))


def set_secret(service_client, arn, token):
    """Set the pending secret in the database

    This method tries to login to the database with the AWSPENDING secret and returns on success. If that fails, it
    tries to login with the AWSCURRENT and AWSPREVIOUS secrets. If either one succeeds, it sets the AWSPENDING password
    as the user password in the database. Else, it throws a ValueError.

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier

        token (string): The ClientRequestToken associated with the secret version

    Raises:
        ResourceNotFoundException: If the secret with the specified arn and stage does not exist

        ValueError: If the secret is not valid JSON or valid credentials are found to login to the database

        KeyError: If the secret json does not contain the expected keys

    """
    # First try to login with the pending secret, if it succeeds, return
    pending_dict = get_secret_dict(service_client, arn, "AWSPENDING", token)
    conn = get_connection(pending_dict)
    if conn:
        conn.close()
        logger.info("setSecret: AWSPENDING secret is already set as password in MySQL DB for secret arn %s." % arn)
        return

    # Now try the current password
    conn = get_connection(get_secret_dict(service_client, arn, "AWSCURRENT"))
    if not conn:
        # If both current and pending do not work, try previous
        try:
            conn = get_connection(get_secret_dict(service_client, arn, "AWSPREVIOUS"))
        except service_client.exceptions.ResourceNotFoundException:
            conn = None

    # If we still don't have a connection, raise a ValueError
    if not conn:
        logger.error("setSecret: Unable to log into database with previous, current, or pending secret of secret arn %s" % arn)
        raise ValueError("Unable to log into database with previous, current, or pending secret of secret arn %s" % arn)

    # Now set the password to the pending password
    try:
        with conn.cursor() as cur:
            cur.execute("SET PASSWORD = PASSWORD(%s)", pending_dict['password'])
            conn.commit()
            logger.info("setSecret: Successfully set password for user %s in MySQL DB for secret arn %s." % (pending_dict['username'], arn))
    finally:
        conn.close()


def test_secret(service_client, arn, token):
    """Test the pending secret against the database

    This method tries to log into the database with the secrets staged with AWSPENDING and runs
    a permissions check to ensure the user has the corrrect permissions.

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier

        token (string): The ClientRequestToken associated with the secret version

    Raises:
        ResourceNotFoundException: If the secret with the specified arn and stage does not exist

        ValueError: If the secret is not valid JSON or valid credentials are found to login to the database

        KeyError: If the secret json does not contain the expected keys

    """
    # Try to login with the pending secret, if it succeeds, return
    conn = get_connection(get_secret_dict(service_client, arn, "AWSPENDING", token))
    if conn:
        # This is where the lambda will validate the user's permissions. Uncomment/modify the below lines to
        # tailor these validations to your needs
        try:
            with conn.cursor() as cur:
                cur.execute("SELECT NOW()")
                conn.commit()
        finally:
            conn.close()

        logger.info("testSecret: Successfully signed into MySQL DB with AWSPENDING secret in %s." % arn)
        return
    else:
        logger.error("testSecret: Unable to log into database with pending secret of secret ARN %s" % arn)
        raise ValueError("Unable to log into database with pending secret of secret ARN %s" % arn)


def finish_secret(service_client, arn, token):
    """Finish the rotation by marking the pending secret as current

    This method finishes the secret rotation by staging the secret staged AWSPENDING with the AWSCURRENT stage.

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier

        token (string): The ClientRequestToken associated with the secret version

    """
    # First describe the secret to get the current version
    metadata = service_client.describe_secret(SecretId=arn)
    current_version = None
    for version in metadata["VersionIdsToStages"]:
        if "AWSCURRENT" in metadata["VersionIdsToStages"][version]:
            if version == token:
                # The correct version is already marked as current, return
                logger.info("finishSecret: Version %s already marked as AWSCURRENT for %s" % (version, arn))
                return
            current_version = version
            break

    # Finalize by staging the secret version current
    service_client.update_secret_version_stage(SecretId=arn, VersionStage="AWSCURRENT", MoveToVersionId=token, RemoveFromVersionId=current_version)
    logger.info("finishSecret: Successfully set AWSCURRENT stage to version %s for secret %s." % (version, arn))


def get_connection(secret_dict):
    """Gets a connection to MySQL DB from a secret dictionary

    This helper function tries to connect to the database grabbing connection info
    from the secret dictionary. If successful, it returns the connection, else None

    Args:
        secret_dict (dict): The Secret Dictionary

    Returns:
        Connection: The pymysql.connections.Connection object if successful. None otherwise

    Raises:
        KeyError: If the secret json does not contain the expected keys

    """
    # Parse and validate the secret JSON string
    port = int(secret_dict['port']) if 'port' in secret_dict else 3306
    dbname = secret_dict['dbname'] if 'dbname' in secret_dict else None

    # Try to obtain a connection to the db
    try:
        conn = pymysql.connect(secret_dict['host'], user=secret_dict['username'], passwd=secret_dict['password'], port=port, db=dbname, connect_timeout=5)
        return conn
    except pymysql.OperationalError:
        return None


def get_secret_dict(service_client, arn, stage, token=None):
    """Gets the secret dictionary corresponding for the secret arn, stage, and token

    This helper function gets credentials for the arn and stage passed in and returns the dictionary by parsing the JSON string

    Args:
        service_client (client): The secrets manager service client

        arn (string): The secret ARN or other identifier

        token (string): The ClientRequestToken associated with the secret version, or None if no validation is desired

        stage (string): The stage identifying the secret version

    Returns:
        SecretDictionary: Secret dictionary

    Raises:
        ResourceNotFoundException: If the secret with the specified arn and stage does not exist

        ValueError: If the secret is not valid JSON

    """
    required_fields = ['host', 'username', 'password']

    # Only do VersionId validation against the stage if a token is passed in
    if token:
        secret = service_client.get_secret_value(SecretId=arn, VersionId=token, VersionStage=stage)
    else:
        secret = service_client.get_secret_value(SecretId=arn, VersionStage=stage)
    plaintext = secret['SecretString']
    secret_dict = json.loads(plaintext)

    # Run validations against the secret
    if 'engine' not in secret_dict or secret_dict['engine'] != 'mysql':
        raise KeyError("Database engine must be set to 'mysql' in order to use this rotation lambda")
    for field in required_fields:
        if field not in secret_dict:
            raise KeyError("%s key is missing from secret JSON" % field)

    # Parse and return the secret JSON string
    return secret_dict
