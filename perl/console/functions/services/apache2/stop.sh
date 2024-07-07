#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

# Function to stop apache2
stop_apache2() {
  if sudo service apache2 status > /dev/null; then
    echo -e "${YELLOW}Stopping Apache2...${NC}"
    sudo service apache2 stop
    if sudo service apache2 status > /dev/null; then
      echo -e "${RED}Failed to stop Apache2.${NC}"
      exit 1
    fi
  fi
  echo -e "${GREEN}Apache2 stopped.${NC}"
}
