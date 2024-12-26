#!/bin/bash

curl --fail -s -X POST http://xcash-node:18281/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' -H 'Content-Type: application/json' || exit 1
