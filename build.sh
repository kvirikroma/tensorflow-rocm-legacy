#!/bin/bash

sudo docker build --build-arg USERNAME=$USER -t tf-rocm-legacy .
