#!/bin/bash
set -euo pipefail

curl --location \
     --request POST 'http://127.0.0.1:8545' \
     --header 'Content-Type: application/json' \
     --data-raw '{
    "jsonrpc": "2.0",
    "method": "admin_changeLogLevel",
    "params": [
        "DEBUG", ["org.hyperledger.besu.ethereum.api.jsonrpc"]
    ],
    "id": 1
}
'

