#!/usr/bin/env bash

set -eou pipefail

echo "Fetching list of cache key"
cacheKeys=$(gh cache list --ref $BRANCH --limit 10 --json id --jq '.[].id')
echo "Cache_key ids: $cacheKeys"


## Setting this to not fail the workflow while deleting cache keys.
set +e
echo "Deleting caches..."
for cacheKey in $cacheKeys
do
    echo "Deleting cache_key id: $cacheKey"
    gh cache delete $cacheKey
done
echo "Done"