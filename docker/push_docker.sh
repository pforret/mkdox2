#!/usr/bin/env bash
# build pforret/mkdox-zensical for amd64 + arm64 and push it as :latest and :<zensical version>
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
image="pforret/mkdox-zensical"
platforms="linux/amd64,linux/arm64"
version=$(awk -F: '/^FROM zensical\/zensical:/ {print $2; exit}' Dockerfile)
[[ -z "$version" || "$version" == "latest" ]] && {
  echo "Dockerfile must pin zensical/zensical:<version> (found '${version:-none}')" >&2
  exit 1
}

# multi-platform builds need a docker-container builder (the default docker driver can't do them)
builder="mkdox-builder"
docker buildx inspect "$builder" &>/dev/null || docker buildx create --name "$builder" --driver docker-container >/dev/null

echo "Build $image:$version + :latest for $platforms"
docker buildx build --builder "$builder" --pull \
  --platform "$platforms" \
  -t "$image:latest" \
  -t "$image:$version" \
  --push .
