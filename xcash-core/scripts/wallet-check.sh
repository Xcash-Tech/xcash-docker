#!/bin/bash

curl --fail -s -X POST http://xcash-wallet:18285/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"get_address"}' -H 'Content-Type: application/json' || exit 1
