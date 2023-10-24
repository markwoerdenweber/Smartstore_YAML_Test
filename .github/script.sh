USED_BRANCH=$GITHUB_REF_NAME
echo "::set-output name=value::${USED_BRANCH:-$env:GITHUB_REF_NAME}"
