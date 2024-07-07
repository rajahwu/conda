#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

start_php_fpm() {
  echo -e "${YELLOW}Starting PHP 8.2-FPM...${NC}"
  sudo service php8.2-fpm start
  if sudo service php8.2-fpm status > /dev/null; then
    echo -e "${GREEN}PHP 8.2-FPM started successfully.${NC}"
    return 0
  else
    echo -e "${RED}Failed to start PHP 8.2-FPM.${NC}"
    return 1
  fi
}
