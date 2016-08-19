# Stem

A trivial but useful Nerves application that does nothing in particular, but
acts as a Nerves Cell, and thus can be discovered on a network, updated and
managed remotely.

A device running Stem permits unrestricted uploading of other firmware,
allowing it to be turned into another type of Nerves Cell. Get it? Stem Cell?

In particular, it is useful to have a few uSD cards laying around with
Stem on them, so that a device can be booted and discovered on a network,
in preparation for pushing a more specific nerves application to the device
over a LAN connection.

## Building and Burning a "Stem Cell"

Build your firmware:

```bash
mix deps
mix firmware
mix firmware.burn
```

Boot firmware on your target device, and it should be on a network!

## Interacting with the Stem Cell

You can use the [cell-tool](http://github.com/nerves-project/cell-tool) CLI to manage the firmware, as follows:

```bash
cell list         # discover a cell
cell push <fw>    # push firmware to the cell
```
## How it works

This is a pretty simple app, ust including `nerves_networking` and `nerves_cell` in deps, and having a few lines of intialization.  Most of the magic is actually in the mix.exs, as project metadata.
