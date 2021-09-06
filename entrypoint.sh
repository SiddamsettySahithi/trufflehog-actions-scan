#!/usr/bin/env sh

set -e # Abort script at first error

args=" --regex --entropy=false " # Default trufflehog options

# By default the 'WORKDIR' of our Docker image is set to the 'GITHUB_WORKSPACE'
# which is mounted into our image. This means, as long as a checkout action was
# done before our action runs, we'll have access to the repository.
#githubRepo="." # Default target repository
#query="$args $githubRepo" # Build args query with repository url
#trufflehog3 $query

if [ -n "${INPUT_BRANCH}" ]; then
  args="${args} --branch ${INPUT_BRANCH}"
fi

/usr/local/bin/trufflehog3 ${args} .
