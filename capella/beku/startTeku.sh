#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml 

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

GENESIS="${SCRIPTDIR}/beku-genesis.ssz"
rm -rf /tmp/teku
rm -rf "${GENESIS}"

export GENESIS_TIME=$(($(date +%s) + 30))
# - 24 seconds per epoch, so epoch 1 for capella
SHANGHAI=$(($GENESIS_TIME + 24)) 
sed  -i '' -e "s/\"shanghaiTime\": .*,/\"shanghaiTime\": $SHANGHAI,/" execution-genesis.json

echo "********************"
echo "TEKU Genesis : $GENESIS_TIME"
echo "BESU Shanghai: $SHANGHAI" 
echo "********************"

$TEKU genesis mock --output-file "${GENESIS}" --network config.yaml --validator-count 256 --genesis-time $GENESIS_TIME

# LOG4J_CONFIGURATION_FILE=./log4j2-test.xml
$TEKU \
  --ee-endpoint http://127.0.0.1:8551 \
  --ee-jwt-secret-file="jwtsecret.txt" \
  --validators-proposer-default-fee-recipient=0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b \
  --Xinterop-enabled=true \
  --Xinterop-number-of-validators=256 \
  --Xinterop-owned-validator-start-index=0 \
  --Xinterop-owned-validator-count=256 \
  --network=config.yaml \
  --p2p-private-key-file=teku.key \
  --rest-api-enabled \
  --rest-api-docs-enabled \
  --Xstartup-target-peer-count=0 \
  --Xstartup-timeout-seconds=0 \
  --initial-state "${GENESIS}" \
  --data-path /tmp/teku
