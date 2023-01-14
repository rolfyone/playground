# Capella Besu Teku test

Special thanks to Adrian, as always. Largely based this on (his beku)[https://github.com/ajsutton/merge-scripts/tree/main/beku]
## Setup

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Process 
 To start the cluster, first run `./startTeku.sh`, and it will update genesis time.
Once it prints genesis time to screen, you then run `./startBesu.sh`, it'll  look like:

```
➜  beku git:(main) ✗ ./startTeku.sh
********************
TEKU Genesis : 1673660296
BESU Shanghai: 1673660320
********************

# Now you can run ./startBesu in another console
```

## Run Besu
Run the `startBesu.sh` script to start the besu instance for the network.

There is a `debugBesu.sh` to enable debug mode.

## Run Teku
Run the `startTeku.sh` script to start the teku instance for the network.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.


## Overview

 - Besu starts, produces blocks up to 5, where it hits TTD, and waits for CL.
 - CL Starts in altair at genesis (0), transitions to Bellatrix at epoch 1 (slot 4)
 - TTD detected at slot 4 (CL) and the first POS block on Besu is 4. (symmetric)
 - Capella transition is epoch 2 (slot 8).
