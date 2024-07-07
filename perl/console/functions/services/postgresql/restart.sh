#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

# Function to restart postgresql
restart_postgresql() {
  echo -e "${YELLOW}Restarting PostgreSQL...${NC}"
  sudo service postgresql restart
  if ! sudo service postgresql status > /dev/null; then
    echo -e "${RED}Failed to restart PostgreSQL.${NC}"
    exit 1
  fi
  echo -e "${GREEN}PostgreSQL restarted.${NC}"
}
