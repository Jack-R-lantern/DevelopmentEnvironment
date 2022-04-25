#!/bin/bash

docker run -it --rm -v $1:$2 gtest:latest
