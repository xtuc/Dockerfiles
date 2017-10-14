#!/bin/sh -x
DATA_DIR=/tmp

TOPOLOGY_FILE=$DATA_DIR/$1
SUBNET=$2

OUT_DIR=$DATA_DIR/out
SCAN_FILE=$DATA_DIR/scan.xml

if [ "$USE_NMAP" = "true" ]; then
  nmap -oX $SCAN_FILE $SUBNET
  NMAP_OPTS=--nmap-xml $SCAN_FILE
fi

mkdir -p $OUT_DIR

python rev-proxy-grapher/rev-proxy-grapher.py \
  --topology $TOPOLOGY_FILE \
   $NMAP_OPTS \
  --out $OUT_DIR/graph.png
