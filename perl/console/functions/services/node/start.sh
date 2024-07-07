#!/bin/bash
source "$(dirname "$0")/../../../vars/colors.sh"

start_node_version() {
  local required_version=18
  echo -e "${YELLOW}Using nvm to switch to node 18...${NC}"
  nvm use 18
  local nvm_use_status=$?
  if [[ ${nvm_use_status} -ne 0 ]]; then
    echo -e "${RED}Failed to switch to Node 18. Please install Node 18 or higher using nvm.${NC}"
    return 1
  fi
  local node_version_output=$(node -v)
  local current_version=$(echo "${node_version_output}" | grep -o '[0-9]*' | head -1)
  if [[ "${current_version}" -lt "${required_version}" ]]; then
    echo -e "${RED}Failed to switch to Node 18. Please install Node 18 or higher using nvm.${NC}"
    return 1
  fi
  
  echo -e "${GREEN}Node version is ${current_version}, which is 18 or higher.${NC}"
  return 0
}