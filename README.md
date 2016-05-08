# Stem

A trivial application that does nothing, but can be updated remotely.
Demonstrates configuration and dependencies for firmware updates.

## Building & updating (temporary hacky instructions):

    mix deps
    mix firmware
    mix firmware.burn

Boot your firmware, then to udpate

    mix clean
    mix firmware        # has new build date

Now, if you have `curl` and know your device IP, you can update firmware:

    curl -v -T _images/rpi2/stem.fw "http://<ip>:8988/firmware" \
    -H "Content-Type: application/x-firmware" -H "X-Reboot: true"`


## How it works

It just includes `:nerves_firmware` in deps and apps in `mix.exs`.  That
module takes care of all the rest.   See [nerves_firmware](https://github.com/ghitchens/nerves_firmware) for more information.

## WARNING!  Very Preliminary

There are a nubmer of things not yet final here, including exact naming and
format of firmware metadata.  This WILL change shortly.
