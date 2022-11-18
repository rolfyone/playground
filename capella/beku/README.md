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

