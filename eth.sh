#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=us2.ethermine.org:3333
WALLET=0x60f5B76AC2b269FAc0196dABC0dBAA54317d1fE4.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
