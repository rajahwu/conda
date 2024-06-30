#!/bin/bash

# Get the directory where the script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the base directories
BASE_DIR="$script_dir/../functions"
NEW_BASE_DIR="$BASE_DIR/services"

# Define service directories
SERVICES=("apache2" "hostname" "node" "php_fpm" "postgresql")

# Function to create new service directories
create_service_dirs() {
  for service in "${SERVICES[@]}"; do
    mkdir -p "$NEW_BASE_DIR/$service"
  done
}

# Function to move and rename scripts
move_scripts() {
  mv "$BASE_DIR/check_apache2.sh" "$NEW_BASE_DIR/apache2/check.sh"
  mv "$BASE_DIR/restart_apache2.sh" "$NEW_BASE_DIR/apache2/restart.sh"
  mv "$BASE_DIR/start_apache2.sh" "$NEW_BASE_DIR/apache2/start.sh"
  mv "$BASE_DIR/stop_apache2.sh" "$NEW_BASE_DIR/apache2/stop.sh"

  mv "$BASE_DIR/check_php_fpm.sh" "$NEW_BASE_DIR/php_fpm/check.sh"
  mv "$BASE_DIR/restart_php_fpm.sh" "$NEW_BASE_DIR/php_fpm/restart.sh"
  mv "$BASE_DIR/start_php_fpm.sh" "$NEW_BASE_DIR/php_fpm/start.sh"
  mv "$BASE_DIR/stop_php_fpm.sh" "$NEW_BASE_DIR/php_fpm/stop.sh"

  mv "$BASE_DIR/check_postgresql.sh" "$NEW_BASE_DIR/postgresql/check.sh"
  mv "$BASE_DIR/restart_postgresql.sh" "$NEW_BASE_DIR/postgresql/restart.sh"
  mv "$BASE_DIR/start_postgresql.sh" "$NEW_BASE_DIR/postgresql/start.sh"
  mv "$BASE_DIR/stop_postgresql.sh" "$NEW_BASE_DIR/postgresql/stop.sh"

  mv "$BASE_DIR/check_node_version.sh" "$NEW_BASE_DIR/node/check.sh"
  mv "$BASE_DIR/start_node_version.sh" "$NEW_BASE_DIR/node/start.sh"

  mv "$BASE_DIR/check_hostname.sh" "$NEW_BASE_DIR/hostname/check.sh"
}

# Function to update service scripts
update_service_scripts() {
  # Update start.sh
  cat > "$script_dir/../bin/services/start.sh" <<EOL
#!/bin/bash

# Get the directory where the script is located
script_dir="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
source "\$script_dir/../../vars/colors.sh"

# Source check functions
source "\$script_dir/../../functions/services/apache2/check.sh"
source "\$script_dir/../../functions/services/hostname/check.sh"
source "\$script_dir/../../functions/services/node/check.sh"
source "\$script_dir/../../functions/services/php_fpm/check.sh"
source "\$script_dir/../../functions/services/postgresql/check.sh"

# Source start functions
source "\$script_dir/../../functions/services/apache2/start.sh"
source "\$script_dir/../../functions/services/node/start.sh"
source "\$script_dir/../../functions/services/php_fpm/start.sh"
source "\$script_dir/../../functions/services/postgresql/start.sh"

# Function to check and start services if needed
check_and_start_service() {
  local check_function=\$1
  local start_function=\$2
  if ! \$check_function; then
    if [[ -n \$start_function ]]; then
      \$start_function
    fi
  fi
}

# Check and start each service
check_and_start_service check_apache2 start_apache2
check_and_start_service check_hostname ""  # No start function needed for hostname
check_and_start_service check_node start_node
check_and_start_service check_php_fpm start_php_fpm
check_and_start_service check_postgresql start_postgresql

echo -e "\${GREEN}All services checked and started as necessary.\${NC}"
EOL

  # Update stop.sh
  cat > "$script_dir/../bin/services/stop.sh" <<EOL
#!/bin/bash

# Get the directory where the script is located
script_dir="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
source "\$script_dir/../../vars/colors.sh"

# Source stop functions
source "\$script_dir/../../functions/services/apache2/stop.sh"
source "\$script_dir/../../functions/services/node/stop.sh"
source "\$script_dir/../../functions/services/php_fpm/stop.sh"
source "\$script_dir/../../functions/services/postgresql/stop.sh"

# Execute the functions
stop_apache2
stop_node_version
stop_php_fpm
stop_postgresql

echo -e "\${GREEN}Services stopped successfully.\${NC}"
EOL

  # Update restart.sh
  cat > "$script_dir/../bin/services/restart.sh" <<EOL
#!/bin/bash

# Get the directory where the script is located
script_dir="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
source "\$script_dir/../../vars/colors.sh"

# Source restart functions
source "\$script_dir/../../functions/services/apache2/restart.sh"
source "\$script_dir/../../functions/services/php_fpm/restart.sh"
source "\$script_dir/../../functions/services/postgresql/restart.sh"

# Execute the functions
restart_apache2
restart_php_fpm
restart_postgresql

echo -e "\${GREEN}Services restarted successfully.\${NC}"
EOL

  # Update status.sh
  cat > "$script_dir/../bin/services/status.sh" <<EOL
#!/bin/bash

# Get the directory where the script is located
script_dir="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
source "\$script_dir/../../vars/colors.sh"

# Source status functions
source "\$script_dir/../../functions/services/apache2/check.sh"
source "\$script_dir/../../functions/services/php_fpm/check.sh"
source "\$script_dir/../../functions/services/postgresql/check.sh"

# Function to check the status of services
check_service_status() {
  local status_function=\$1
  if \$status_function; then
    return 0
  else
    return 1
  fi
}

# Check the status of each service
check_service_status check_apache2
check_service_status check_php_fpm
check_service_status check_postgresql

echo -e "\${CYAN}All services status checked.\${NC}"
EOL
}

# Create new directories
create_service_dirs

# Move scripts to new directories
move_scripts

# Update service scripts
update_service_scripts

echo "Refactoring completed successfully."
