#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

start_postgresql() {
  echo -e "${YELLOW}Starting PostgreSQL...${NC}"
  sudo service postgresql start
  if sudo service postgresql status > /dev/null; then
    echo -e "${GREEN}PostgreSQL started successfully.${NC}"
    return 0
  else
    echo -e "${RED}Failed to start PostgreSQL.${NC}"
    return 1
  fi
}
