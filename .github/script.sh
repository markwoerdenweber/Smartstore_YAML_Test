str=${$GITHUB_REF_NAME:-$env:GITHUB_REF_NAME}
find=".x"
replace=""
echo "branch-label=${str//$find/$replace}" >> $GITHUB_OUTPUT
