#!/bin/bash
source ./console/vars/colors.sh

check_postgresql() {
  if sudo service postgresql status > /dev/null; then
    echo -e "${GREEN}PostgreSQL is running.${NC}"
    return 0
  else
    echo -e "${YELLOW}PostgreSQL is not running.${NC}"
    return 1
  fi
}
