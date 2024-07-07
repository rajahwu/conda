#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

check_dbus() {
  if sudo service dbus status > /dev/null; then
    return 0
  else
    return 1
  fi
}

