#!/usr/bin/env bash

image="pforret/mkdox-zensical"
docker build --platform linux/amd64 -t "$image" . &&
docker push "$image"
