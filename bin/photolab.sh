#!/bin/bash

export OUTDIR=${OUTDIR:-.}

function packit(){
  export PRJ=$1
  echo "Project: $PRJ  -- type: $2"
  cd $PRJ
  rm -fr ${PRJ}.md5
  rename 's/ /_/g' *
  find . -type f ! -name \*.md5 | sort | xargs md5sum > ${PRJ}.md5
  cd ..
  rar  a -r -rr10 -m1 -v2g $OUTDIR/${PRJ}${2}.rar $PRJ
}

echo OUTDIR: $OUTDIR
find $1 -name .DS_Store -delete
packit $1 $2
