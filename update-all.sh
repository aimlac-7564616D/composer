#!/bin/bash

git submodule update --init --recursive --depth 1
git submodule foreach git pull origin main
