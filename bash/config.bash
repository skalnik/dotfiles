#!/usr/bin/env bash

HISTFILESIZE=1000000
HISTSIZE=1000000
shopt -s histappend

export PATH=".git/safe/../../bin:$PATH"
