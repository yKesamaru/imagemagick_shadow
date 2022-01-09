#!/bin/bash

convert graph_2_no_shadow.png \
    \( +clone -background black -shadow 10x20+1+1 \) \
    +swap -background none -layers merge +repage \
    graph_2_shadow.png
