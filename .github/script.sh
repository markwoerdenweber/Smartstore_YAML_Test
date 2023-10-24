BRANCH_NAME_LINUX=$GITHUB_REF_NAME
BRANCH_NAME_WINDOWS=$env:GITHUB_REF_NAME

# Take the non-empty name.
str=${BRANCH_NAME_LINUX:-BRANCH_NAME_WINDOWS}

# Replace trailing variable versions.
find=".x"
replace=""
BRANCH_NAME=${str//$find/$replace}

# Send as output.
echo "branch-label=${BRANCH_NAME}" >> $GITHUB_OUTPUT

# For testing.
echo "1.2.3"
