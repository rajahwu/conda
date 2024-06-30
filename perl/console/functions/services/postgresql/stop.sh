#!/bin/bash
source ./console/vars/colors.sh

# Function to stop postgresql
stop_postgresql() {
  if sudo service postgresql status > /dev/null; then
    echo -e "${YELLOW}Stopping PostgreSQL...${NC}"
    sudo service postgresql stop
    if sudo service postgresql status > /dev/null; then
      echo -e "${RED}Failed to stop PostgreSQL.${NC}"
      exit 1
    fi
  fi
  echo -e "${GREEN}PostgreSQL stopped.${NC}"
}
