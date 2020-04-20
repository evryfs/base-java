#!/usr/bin/env bash

git tag $(git branch --show-current)-$(date +%Y%m%d) -f
