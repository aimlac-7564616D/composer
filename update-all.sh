#!/bin/bash

git submodule update --init --recursive --depth 1 --single-branch
git submodule update --remote --merge --depth 1 --single-branch
