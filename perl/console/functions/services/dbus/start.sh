#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

echo -e "${YELLOW}Starting Apache2...${NC}"
sudo service dbus start
if sudo service dbus status > /dev/null; then
  echo -e "${GREEN}dbus started successfully.${NC}"
  exit 0
else
  echo -e "${RED}Failed to start dbus.${NC}"
  exit 1
fi

