#!/bin/bash
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img=../containers/argos_full.sif
cmd=$(basename "$0")
arg="$@"

apptainer --quiet exec "${dir}/${img}" $cmd "$@"
