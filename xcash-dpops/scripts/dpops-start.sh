#!/bin/bash
  ./xcash-dpops --block-verifiers-secret-key ${NODE_SEC_KEY} \
    --xcash-daemon-ip-address xcash-node \
    --xcash-wallet-ip-address xcash-wallet \
    --mongodb-uri "mongodb://mongodb:27017" \
    --init-db-from-seeds && \
  ./xcash-dpops --block-verifiers-secret-key ${NODE_SEC_KEY} \
    --xcash-daemon-ip-address xcash-node \
    --xcash-wallet-ip-address xcash-wallet \
    --mongodb-uri "mongodb://mongodb:27017" \
    --server-log-file /data/logs/dpops-server.log \
    --total-threads 4
