#!/bin/bash

# Get the directory where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/../../vars/colors.sh"

# Source status functions
source "$script_dir/../../../functions/services/apache2/check.sh"
source "$script_dir/../../../functions/services/php_fpm/check.sh"
source "$script_dir/../../../functions/services/postgresql/check.sh"
source "$script_dir/../../../functions/services/node/check.sh"

# Function to check the status of services
check_service_status() {
  local status_function=$1
  if $status_function; then
    return 0
  else
    return 1
  fi
}

# Check the status of each service
check_service_status check_node_version
check_service_status check_apache2
check_service_status check_php_fpm
check_service_status check_postgresql

echo -e "${CYAN}All services status checked.${NC}"
