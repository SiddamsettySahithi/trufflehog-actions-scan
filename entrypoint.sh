#!/usr/bin/env sh

set -e # Abort script at first error

args=" --no-entropy --format=html --output=secrets.html " # Default trufflehog options

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

# By default the 'WORKDIR' of our Docker image is set to the 'GITHUB_WORKSPACE'
# which is mounted into our image. This means, as long as a checkout action was
# done before our action runs, we'll have access to the repository.
githubRepo="." # Default target repository
query="$args $githubRepo" # Build args query with repository url
trufflehog3 $query
