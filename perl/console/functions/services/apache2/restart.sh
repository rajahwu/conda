#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

# Function to restart apache2
restart_apache2() {
  echo -e "${YELLOW}Restarting Apache2...${NC}"
  sudo service apache2 restart
  if ! sudo service apache2 status > /dev/null; then
    echo -e "${RED}Failed to restart Apache2.${NC}"
    exit 1
  fi
  echo -e "${GREEN}Apache2 restarted.${NC}"
}
