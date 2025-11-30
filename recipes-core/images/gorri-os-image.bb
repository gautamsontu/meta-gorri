# Base this image on core-image-base
include recipes-core/images/core-image-base.bb

COMPATIBLE_MACHINE = "^rpi$"

IMAGE_INSTALL:append = " busybox python3 python3-modules mosquitto psplash"
#IMAGE_INSTALL:append = " packagegroup-rpi-test"
