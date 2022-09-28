#!/bin/bash
# maketar
OUTPUT_FILE="./src.tar.gz"
tar -zcf $OUTPUT_FILE -C . ./src
cat $OUTPUT_FILE | base64 > $OUTPUT_FILE.b64
rm $OUTPUT_FILE
