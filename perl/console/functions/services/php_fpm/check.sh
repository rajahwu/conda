#!/bin/bash
source ../../../../../vars/colors.sh

check_php_fpm() {
  if sudo service php8.2-fpm status > /dev/null; then
    echo -e "${GREEN}PHP 8.2-FPM is running.${NC}"
    return 0
  else
    echo -e "${YELLOW}PHP 8.2-FPM is not running.${NC}"
    return 1
  fi
}
