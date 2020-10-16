#!/bin/sh
# This script imports wallets and then exits validators

/app/validator/image.binary accounts import --keys-dir /keys --${TESTNET}
/app/validator/image.binary accounts voluntary-exit --beacon-rpc-provider ${BEACON} --tls-cert /etc/ssl/certs/ca-certificates.crt --${TESTNET}
