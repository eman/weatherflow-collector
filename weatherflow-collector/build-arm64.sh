#!/bin/bash
docker build  -f Dockerfile.arm -t eman/weatherflow-collector:latest-arm64 .
# docker push lux4rd0/weatherflow-collector:latest-arm64
# docker push lux4rd0/weatherflow-collector:$1-arm64
