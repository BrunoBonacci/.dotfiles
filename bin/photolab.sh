#!/bin/bash

export OUTDIR=${OUTDIR:-.}

function packit(){
  export PRJ=$1
  echo "Project: $PRJ  -- type: $2"
  cd $PRJ
  rm -fr ${PRJ}.md5
  md5sum $( find . -type f ! -name \*.md5) > ${PRJ}.md5
  cd ..
  rar  a -r -rr10 -m1 -v1g $OUTDIR/${PRJ}${2}.rar $PRJ
}

echo OUTDIR: $OUTDIR
packit $1 $2
