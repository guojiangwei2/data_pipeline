#!/bin/bash
set -e

# To add addtional scripts, just add lines here
SCRIPTS="data_pipeline_tailer"

if dpkg -i /work/dist/*.deb; then
  echo "Looks like it installed correctly"
else
  echo "Dpkg install failed"
  exit 1
fi

for scr in $SCRIPTS
do
  which $scr >/dev/null || (echo "$scr failed to install!"; exit 1)
  echo "Running '$scr -h' to make sure it works"
  $scr -h >/dev/null || (echo "$scr failed to execute!"; exit 1)
done

echo "Everything worked!"