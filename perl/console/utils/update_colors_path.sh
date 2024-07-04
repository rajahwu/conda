#!/bin/bash

# Correct relative paths based on script locations
update_path() {
    local script="$1"
    case "$script" in
        *functions/services/hostname/check.sh|*functions/services/apache2/check.sh|*functions/services/node/check.sh|*functions/services/php_fpm/check.sh|*functions/services/postgresql/check.sh)
            sed -i "s|source .*vars/colors.sh|source ../../../../../vars/colors.sh|g" "$script"
            ;;
        *bin/services/start.sh|*bin/services/stop.sh|*bin/services/restart.sh|*bin/services/status.sh|*bin/services/suspend.sh)
            sed -i "s|source .*vars/colors.sh|source ../../../../vars/colors.sh|g" "$script"
            ;;
        *)
            echo "Skipping $script: no matching pattern found."
            ;;
    esac
}

# Find all .sh files and update paths
find /var/www/html/apps/Training/conda/perl/console -type f -name '*.sh' | while read -r script; do
    update_path "$script"
done

echo "All paths to colors.sh have been updated."

