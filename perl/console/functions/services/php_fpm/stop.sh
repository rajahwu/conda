#!/bin/bash
source ../../../../vars/colors.sh

# Function to stop php8.2-fpm
stop_php_fpm() {
  if sudo service php8.2-fpm status > /dev/null; then
    echo -e "${YELLOW}Stopping PHP 8.2-FPM...${NC}"
    sudo service php8.2-fpm stop
    if sudo service php8.2-fpm status > /dev/null; then
      echo -e "${RED}Failed to stop PHP 8.2-FPM.${NC}"
      exit 1
    fi
  fi
  echo -e "${GREEN}PHP 8.2-FPM stopped.${NC}"
}
