#!/bin/bash

OUT=$PWD/generated
LIST=$OUT/library-list.json

rm -rf $OUT
mkdir $OUT

cd libs
printf "[\n" >> $LIST
for D in *; do
  if [ -d "${D}" ]; then
    cd $D
    if [ -f "evothings.json" ]; then
      echo "Collecting evothings.json ..."
      cat evothings.json >> $LIST
      printf ",\n" >> $LIST
      echo "Making zip for ${D} ..."
      zip -r $OUT/$D.zip *
    fi
    cd ..
  fi
done
cd ..
printf "]" >> $LIST

echo "DONE"
