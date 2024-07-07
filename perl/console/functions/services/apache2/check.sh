#!/bin/bash

source "$(dirname "$0")/../../../vars/colors.sh"

check_apache2() {
  if sudo service apache2 status > /dev/null; then
    echo -e "${GREEN}Apache2 is running.${NC}"
    return 0
  else
    echo -e "${YELLOW}Apache2 is not running.${NC}"
    return 1
  fi
}
