#!/bin/bash

# Function to check for running containers
check_running_containers() {
    running_containers=$(docker ps -q)
    if [ -n "$running_containers" ]; then
        echo "Stopping running containers..."
        docker stop $running_containers
    else
        echo "No running containers found."
    fi
}

# Function to remove all containers
remove_all_containers() {
    all_containers=$(docker ps -a -q)
    if [ -n "$all_containers" ]; then
        echo "Removing all containers..."
        docker rm $all_containers
    else
        echo "No containers found to remove."
    fi
}

# Function to remove all images
remove_all_images() {
    all_images=$(docker images -q)
    if [ -n "$all_images" ]; then
        echo "Removing all images..."
        docker rmi $all_images
    else
        echo "No images found to remove."
    fi
}

# Execute the functions
check_running_containers
remove_all_containers
remove_all_images

echo "Docker cleanup completed."
