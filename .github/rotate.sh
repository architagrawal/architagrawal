#!/usr/bin/env bash
# Pick today's painted scene and write README.md from the template.
# Same order as the portfolio, one scene per UTC day.
set -euo pipefail
cd "$(dirname "$0")/.."
SCENES=(mesas saguaros aurora ocean blackhole canyon flock reef balloons volcano phoenix balloon earthrise nightlake sedona saturn jellyfish lavender)
day=$(( $(date -u +%s) / 86400 ))
scene=${1:-${SCENES[$(( day % ${#SCENES[@]} ))]}}
sed "s/{{SCENE}}/$scene/g" .github/README.template.md > README.md
echo "$scene"
