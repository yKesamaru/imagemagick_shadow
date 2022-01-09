#!/bin/bash

convert input.png \
    \( +clone -background black -shadow 10x20+1+1 \) \
    +swap -background none -layers merge +repage \
    last.png
