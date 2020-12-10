#!/bin/bash

read -p "Is it prerelease? y/n: " confirm_prerelease
if [[ "${confirm_prerelease}" != "${confirm_prerelease#[yes]}" ]] ;then
    export PRE_RELEASE="--prerelease alpha"
fi

echo -e "## Set release type:"

# Release message
COLUMNS=10
PS3='Please enter your choice: '
options=("--prerelease alpha" "--release-as patch" "--release-as minor" "--release-as major" "quit")
select opt in "${options[@]}"
do
    case ${opt} in
        "--prerelease alpha")
            echo -e "\n## \$RELEASE_TYPE set to ${opt} \n"
            if [[ -z ${PRE_RELEASE}  ]]; then
                echo "You said it's not prerelease...Exiting"
                exit 1
                break
            else
                # export RELEASE_TYPE=${opt}
                export RELEASE_TYPE=${PRE_RELEASE}
                break
            fi
            ;;
        "--release-as patch")
            echo -e "\n## \$RELEASE_TYPE set to ${opt} \n"
            if [[ -z ${PRE_RELEASE}  ]]; then
                export RELEASE_TYPE=${opt}
                break
            else
                export RELEASE_TYPE="${opt} ${PRE_RELEASE}"
                break
            fi
            ;;
        "--release-as minor")
            echo -e "\n## \$RELEASE_TYPE set to ${opt} \n"
            if [[ -z ${PRE_RELEASE}  ]]; then
                export RELEASE_TYPE=${opt}
                break
            else
                export RELEASE_TYPE="${opt} ${PRE_RELEASE}"
                break
            fi
            ;;
        "--release-as major")
            echo -e "\n## \$RELEASE_TYPE set to ${opt} \n"
            if [[ -z ${PRE_RELEASE}  ]]; then
                export RELEASE_TYPE=${opt}
                break
            else
                export RELEASE_TYPE="${opt} ${PRE_RELEASE}"
                break
            fi
            ;;
        "quit")
            echo -e "\n## Exiting.. \n"
            exit 1
            ;;
        *) echo -e "\n## Invalid option $REPLY";;
    esac
done

# Get current tag, check if it's prerelease
export CURRENT_TAG=$(git ls-remote --tags --sort="v:refname" ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git | tail -n2 | sed 's/.*\///; s/\^{}//' | grep "alpha")

# If it's not prerelease
if [[ -z ${CURRENT_TAG} ]]; then
    export CURRENT_TAG=$(git ls-remote --tags --sort="v:refname" ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git | tail -n1 | sed 's/.*\///; s/\^{}//')
    echo -e "\nCurrent tag: ${CURRENT_TAG}"
else
  echo -e "\nCurrent tag: ${CURRENT_TAG}"
fi

# Get next tag by running standard-version command with '--dry-run true' flag
echo $(standard-version ${RELEASE_TYPE} --skip.commit --skip.changelog --dry-run true) > next_tag.info
export NEXT_TAG=$(awk -F'=' 'match($0, /tagging release (v[0-9]*.[0-9]*.[0-9]*[-]?(.*?\.)[0-9]*)/, res) {print res[1]}' next_tag.info)
echo "Next tag: ${NEXT_TAG}"
rm next_tag.info

# Finally release
echo -e "\nType release info message and press [ENTER]:\n"
read -p '' release_info

echo -e "\nRelease preview (--dry-run true)"
standard-version "${RELEASE_TYPE}" \
  --compareUrlFormat "http://gitlab.common.internal/{{owner}}/{{repository}}/-/compare/{{previousTag}}...{{currentTag}}" \
  --commitUrlFormat "http://gitlab.common.internal/{{owner}}/{{repository}}/-/commit/{{hash}}" \
  --releaseCommitMessageFormat "chore(release): {{currentTag}} - ${release_info}" \
  --dry-run true

# Confirm release
echo ""
read -p "Confirm release? Only 'yes' will be accepted to approve. Enter value: " confirm_release

if [[ "${confirm_release}" != "${confirm_release#[yes]}" ]] ;then
    # Update and commit CHANGELOG.md, release tag
    standard-version "${RELEASE_TYPE}" \
      --compareUrlFormat "http://gitlab.common.internal/{{owner}}/{{repository}}/-/compare/{{previousTag}}...{{currentTag}}" \
      --commitUrlFormat "http://gitlab.common.internal/{{owner}}/{{repository}}/-/commit/{{hash}}" \
      --releaseCommitMessageFormat "chore(release): {{currentTag}} - ${release_info}"

    # Get current branch name
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}
    echo "Branch name: ${branch_name}"
    # Push to git
    git push --follow-tags origin "${branch_name}"
else
    echo "Aborting release"
fi