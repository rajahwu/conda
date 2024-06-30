# Console Directory

The `console` directory contains various scripts and utilities for managing the services and operations of the project. Below is an overview of the structure and purpose of each subdirectory and file.

## Directory Structure

```plaintext
console/
├── bin
│   ├── dev
│   └── services
│       ├── restart.sh
│       ├── start.sh
│       ├── status.sh
│       └── stop.sh
├── docs
│   └── readme.md
├── functions
│   └── services
│       ├── apache2
│       │   ├── check.sh
│       │   ├── restart.sh
│       │   ├── start.sh
│       │   └── stop.sh
│       ├── hostname
│       │   └── check.sh
│       ├── node
│       │   ├── check.sh
│       │   └── start.sh
│       ├── php_fpm
│       │   ├── check.sh
│       │   ├── restart.sh
│       │   ├── start.sh
│       │   └── stop.sh
│       └── postgresql
│           ├── check.sh
│           ├── restart.sh
│           ├── start.sh
│           └── stop.sh
├── logs
├── readme.md
├── refactor_functions.sh
├── tmp
│   ├── functions.txt
│   └── service_functions.txt
├── utils
│   ├── make_functions_executable.sh
│   ├── write_functions_to_tmp.sh
│   └── write_service_functions_to_tmp.sh
└── vars
    └── colors.sh
```

## Subdirectories and Files

### bin

Contains scripts for various operations.

### dev: Placeholder for development-related scripts

### services: Scripts to manage services

### docs

Documentation-related files.

### functions

Contains service-specific scripts organized into subdirectories.

### logs

Directory for storing log files.

### refactor_functions.sh: Script to refactor functions and reorganize the directory structure

### tmp

Temporary files and directories.

### utils

Utility scripts.

### vars

Variable files.

## Usage

Starting Services: To start all services, run

### Commands

```bash
# Starting Services:
# To check and start all services, run:

./console/bin/services/start.sh
```

```bash
# Stopping Services:
# To stop all running services, run:

./console/bin/services/stop.sh
```

```bash
# Restarting Services:
# To restart or start of all services, run:

./console/bin/services/restart.sh
```

```bash
# Checking status of services:
# To check the status of all services, run:

./console/bin/services/status.sh
```
