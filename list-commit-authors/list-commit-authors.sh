#!/usr/bin/env bash
#
# -------------------------- HEADER --------------------------
#
#   List all commits authors in all cloned repos
#   v1.0
#
#   How to use:
#   Execute the script "./list-commit-authors.sh" into a directory which have all repos cloned into it 
#   Then, verify the content of file "commit-users.txt" to check how many users commited into your projects
#
# -------------------------------------------------------------

GIT_DIRS="$(find -name '.git')"

for i in ${GIT_DIRS}; do
    cd $i
    git log | grep Author | sort | uniq >> /tmp/commit-users-"$(date +%s)".txt
    cd - 
done

printf "\n"
echo "Arquivo exportado! confira a lista de users commit em: /tmp/commit-users.txt"
