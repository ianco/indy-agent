#!/bin/bash

set -e

GENESIS_FILE=/home/indy/ledger/sandbox/pool_transactions_genesis
SANDBOX_DIR=.indy_client/pool/sandbox

# Wait until the Genesis file is there - volume mount
while [ ! -f ${GENESIS_FILE} ]; do
  sleep 2
done

# Copy genesis file from the volume mount from one of the nodes
mkdir -p ${SANDBOX_DIR}
cp ${GENESIS_FILE} ${SANDBOX_DIR}/sandbox.txn

if [ "$MODE" == "cli" ]; then
	indy-cli
else
	/bin/bash
fi

