#!/bin/bash
echo $QBT_PASS | qbt settings set password
set -x
qbt settings set username $QBT_USER
qbt settings set url $QBT_URL
exec "$@"