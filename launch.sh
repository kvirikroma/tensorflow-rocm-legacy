#!/bin/bash

sudo docker run -d --rm \
--name tf-rocm-legacy \
--network host \
--device /dev/dri:/dev/dri \
--device /dev/kfd:/dev/kfd \
--build-arg USERNAME=$USER \
-v $PWD:/mnt \
tf-rocm-legacy
