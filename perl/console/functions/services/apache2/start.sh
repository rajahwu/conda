#!/bin/bash
source /console/vars/colors.sh

start_apache2() {
  echo -e "${YELLOW}Starting Apache2...${NC}"
  sudo service apache2 start
  if sudo service apache2 status > /dev/null; then
    echo -e "${GREEN}Apache2 started successfully.${NC}"
    return 0
  else
    echo -e "${RED}Failed to start Apache2.${NC}"
    return 1
  fi
}