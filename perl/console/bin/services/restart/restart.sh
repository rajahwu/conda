#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/../../vars/colors.sh"

# Source restart functions
source "$script_dir/../../../functions/services/apache2/restart.sh"
source "$script_dir/../../functions/services/php_fpm/restart.sh"
source "$script_dir/../../../functions/services/postgresql/restart.sh"

# Execute the functions
restart_apache2
restart_php_fpm
restart_postgresql

echo -e "${GREEN}Services restarted successfully.${NC}"
