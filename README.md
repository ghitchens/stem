# Stem

A trivial application that does nothing, but can be updated remotely.
Demonstrates configuration and dependencies for firmware updates.

## Very Preliminary

There are a nubmer of things not yet final here, including exact naming/
format of firmware metadata.

## HACK until I get "cell" integration done..

You can update firmware on a device if you know it's IP by doing...

    curl -v -T _images/rpi2/stem.fw "http://<ip>:8988/firmware" \
    -H "Content-Type: application/x-firmware" -H "X-Reboot: true"`
