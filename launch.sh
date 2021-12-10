#!/bin/bash

sudo docker run -it --rm \
--user $UID \
--name tf-rocm-legacy \
--network host \
--device /dev/dri:/dev/dri \
--device /dev/kfd:/dev/kfd \
-v $PWD:/mnt \
tf-rocm-legacy
