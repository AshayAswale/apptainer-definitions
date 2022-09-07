#!/bin/bash
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img=../containers/linux_common_tools.sif
cmd=$(basename "$0")
arg="$@"

apptainer --quiet exec "${dir}/${img}" $cmd "$@"
