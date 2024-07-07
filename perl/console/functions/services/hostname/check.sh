#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

check_hostname() {
  local hostname_ip
  hostname_ip=$(hostname -I | xargs)
  local hostname_ip_status=$?
  if [[ ${hostname_ip_status} -ne 0 ]] || [[ -z "${hostname_ip}" ]]; then
    echo -e "${RED}Failed to retrieve hostname IP.${NC}"
    exit 1
  fi
  
  echo -e "${CYAN}Hostname IP: ${hostname_ip}${NC}"
  local url="http://${hostname_ip}"
  echo -e -n "${CYAN}Curling URL: ${url} - Status Code: ${NC}"
  curl -o /dev/null -s -w "%{http_code}\n" "${url}"

  local url_public="http://${hostname_ip}/public"
  echo -e -n "${CYAN}Curling URL: ${url_public} - Status Code: ${NC}"
  curl -o /dev/null -s -w "%{http_code}\n" "${url_public}"

  return 0
}