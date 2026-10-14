#!/usr/bin/env bash
# Pick today's painted scene and write README.md from the template.
# Same order as the portfolio, one scene per UTC day.
set -euo pipefail
cd "$(dirname "$0")/.."
SCENES=(mesas saguaros aurora ocean blackhole canyon flock reef balloons volcano phoenix balloon earthrise nightlake sedona saturn jellyfish lavender)
day=$(( $(date -u +%s) / 86400 ))
scene=${1:-${SCENES[$(( day % ${#SCENES[@]} ))]}}
# version tag from the last commit that touched the images, so browsers and GitHub's cache refetch after an update
v=$(git log -1 --format=%h -- themes 2>/dev/null)
v=${v:-0}
sed -e "s/{{SCENE}}/$scene/g" -e "s/{{V}}/$v/g" .github/README.template.md > README.md
echo "$scene"
