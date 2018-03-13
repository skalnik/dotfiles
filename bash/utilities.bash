#!/usr/bin/env bash

tabname() {
  echo -n -e "\033]0;$*\007"
}
