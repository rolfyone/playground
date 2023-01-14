#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

rm -rf /tmp/tekuVC

LOG4J_CONFIGURATION_FILE=./log4j_vc.xml \
$TEKU vc \
  --network=auto \
  --Xinterop-enabled=true \
  --Xinterop-number-of-validators=256 \
  --Xinterop-owned-validator-start-index=0 \
  --Xinterop-owned-validator-count=256 \
  --validators-proposer-blinded-blocks-enabled \
  --validators-proposer-default-fee-recipient=0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b \
  --data-path /tmp/tekuVC