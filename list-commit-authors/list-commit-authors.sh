#!/usr/bin/env bash
#
# -------------------------- HEADER --------------------------
#
#   List all commits authors in all cloned repos
#   v1.0
#
#   How to use:
#   1. chmod +x ./list-commit-authors.sh
#   2. Execute the script "./list-commit-authors.sh" into a directory which have all repos cloned into it 
#   3. Then, verify the content of file "/tmp/commit-users.txt" to check how many users commited into your projects
#
# -------------------------------------------------------------

GIT_DIRS="$(find -name '.git')"
TOTAL_AUTHORS="$(wc -l < /tmp/commit-users.txt)"

for i in ${GIT_DIRS}; do
    cd $i
    git log | grep Author | sort | uniq >> /tmp/commit-users.txt
    cd - 
done

printf "\n"
echo "Total of authors: ${TOTAL_AUTHORS}" 
printf "\n"
echo "File exported! check the list of users commit into: /tmp/commit-users.txt \n"
