#!/bin/bash
set -e

echo "[ENTRYPOINT] creating the .ivy2 folder and running the start command"

mkdir -p "/tmp/.ivy2"

# $@ is probably ...  spark-submit --conf spark.jars.ivy=/tmp/.ivy --master local[*] /src/digit_flatmap.py"]

echo "[ENTRYPOINT] Running: $@"
exec "$@"
