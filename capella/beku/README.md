# Capella Besu Teku test

Special thanks to Adrian, as always. Largely based this on (his beku)[https://github.com/ajsutton/merge-scripts/tree/main/beku]
## Setup

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Run Besu
Run the `startBesu.sh` script to start the besu instance for the network.

There is a `debugBesu.sh` to enable debug mode.

## Run Teku
Run the `startTeku.sh` scriupt to start the teku instance for the network.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.


## Overview

 - Besu starts, produces blocks up to 5, where it hits TTD, and waits for CL.
 - CL Starts in altair at genesis (0), transitions to Bellatrix at epoch 1 (slot 4)
 - TTD detected at slot 6 (CL) and the first POS block on Besu is 6. (symmetric)
 - Capella transition is epoch 4 (slot 16).
