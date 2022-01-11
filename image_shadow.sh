#!/bin/bash

while (( $# > 0 ))
do
  case $1 in
  *.png | *.jpg | *.jpeg)
    old_name=$(basename "$1")
    file_path=$(dirname "$1")
    new_name=shadow_"$old_name"
    convert "$new_name" \
      \( +clone -background black -shadow 10x10+0+0 \) \
      +swap -background none -layers merge +repage \
      "${file_path}/${new_name}"
    ;;
  esac
  shift
done