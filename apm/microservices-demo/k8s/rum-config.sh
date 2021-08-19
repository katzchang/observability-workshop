#!/bin/bash
if [ -z ${RUM_TOKEN+x} ]; then echo "RUM_TOKEN is unset. Please export RUM_TOKEN=YOUR_RUM_TOKEN"; fi
envsubst '${REALM},${RUM_TOKEN},${INSTANCE}' < deployment-host.yaml > deployment.yaml
