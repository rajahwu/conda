#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/../../../vars/colors.sh"

# Source stop functions
source "$script_dir/../../../functions/services/apache2/stop.sh"
source "$script_dir/../../../functions/services/php_fpm/stop.sh"
source "$script_dir/../../../functions/services/postgresql/stop.sh"

# Execute the functions
stop_apache2
stop_php_fpm
stop_postgresql

echo -e "${GREEN}Services stopped successfully.${NC}"
