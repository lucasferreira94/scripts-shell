#!/usr/bin/env bash
#
# -------------------------- HEADER --------------------------
#
#   List all commits authors in all cloned repos
#   v1.2
#
#   How to use:
#   1. chmod +x ./list-commit-authors.sh
#   2. Execute the script "./list-commit-authors.sh" into a directory which have all repos cloned into it 
#   3. Then, verify the content of file "/tmp/commit-users.txt" to check how many users commited into your projects
#
# -------------------------------------------------------------

GIT_DIRS="$(find -name '.git')"
TOTAL_AUTHORS="$(wc -l < /tmp/commit-users.txt)"
OUTPUT_FILE="/tmp/commit-users.txt"
TMP_FILE=$(mktemp)

# Clear the output file if it exists
> "$OUTPUT_FILE"

for i in ${GIT_DIRS}; do
    cd $i
    git log | grep Author | sort | uniq -u  >> "$TMP_FILE"
    cd - 
done

# Remove duplicates while preserving order
awk '!seen[$0]++' "$TMP_FILE" > "$OUTPUT_FILE"

rm "$TMP_FILE"

printf "\n"
echo "Total of authors: ${TOTAL_AUTHORS}" 
printf "\n"
echo "File exported! check the list of users commit into: /tmp/commit-users.txt \n"
