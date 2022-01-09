#!/bin/bash

convert graph_2_no_shadow.png \
    \( +clone -background black -shadow 30x2+1+1 \) \
    +swap -background none -layers merge +repage \
    output.png
