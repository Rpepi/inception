# Inception Project - 42

## Overview
This project is part of the 42 school curriculum and aims to introduce students to system administration through the use of Docker. The goal is to set up a small infrastructure composed of different services under specific rules, all containerized using Docker and orchestrated with Docker Compose. This README provides an overview of the project setup without including any bonus features.

## Project Requirements
- **Docker**: All services must run inside Docker containers.
- **Docker Compose**: Use a single `docker-compose.yml` file to define and manage the multi-container setup.
- **Services**:
  - **NGINX**: A web server acting as the entry point, configured to use only ports 80 and 443, with TLSv1.2 or TLSv1.3 for SSL.
  - **WordPress + PHP-FPM**: A WordPress website running with PHP-FPM, without NGINX or Apache inside its container.
  - **MariaDB**: A database to store the WordPress data.
- **Volumes**: 
  - One volume for the WordPress files.
  - One volume for the MariaDB database.
- **Networks**: All containers must communicate within a single Docker network.
- **Security**:
  - Containers must not run as root.
  - Environment variables must be stored securely (e.g., in a `.env` file, not hardcoded).
- **Constraints**:
  - No use of `docker swarm` or other orchestration tools beyond Docker Compose.
  - No external services like Kubernetes or cloud providers.
  - The setup must be done on a virtual machine (e.g., using VirtualBox or UTM).
  - **Makefile**: Automates common tasks like building, running, and cleaning up the Docker setup.
  - **docker-compose.yml**: Defines the services, networks, and volumes.
  - **.env**: Stores environment variables (e.g., database credentials).
  - **src/**: Contains configuration files and Dockerfiles for each service.

## Setup Instructions
1. **Install Docker and Docker Compose**:
   - Ensure Docker and Docker Compose are installed on your system.
   - For Debian-based systems, use:
     ```bash
     sudo apt update
     sudo apt install docker.io docker-compose
     git clone <repository_url> inception
     cd inception

## Configure Environment Variables:
2. **Create a .env file in the project root with the following variables**:
 ```.env
  DB_NAME=wordpress
  DB_USER=wp_user
  DB_PASSWORD=secure_password
  DB_ROOT_PASSWORD=secure_root_password
  WP_ADMIN_USER=admin
  WP_ADMIN_PASSWORD=admin_password
  WP_ADMIN_EMAIL=admin@example.com
```
Ensure the .env file is not tracked by git (add it to .gitignore).

**Build and Run**:
Use the Makefile to build and start the containers
```Bash
make
```
This will:
Build the Docker images for NGINX, WordPress, and MariaDB.
Create the necessary volumes and network.
Start the containers in the correct order.
Access the Website:
Open a browser and navigate to https://localhost or the VM's IP address.
The WordPress site should be accessible, secured with SSL.
Cleaning Up
To stop and remove containers, networks, and volumes:
```bash

make clean
```
To remove all Docker images built for the project:
```bash

make fclean
```
Notes
Ensure the virtual machine has sufficient resources (e.g., 2GB RAM, 20GB disk).
The SSL certificate for NGINX is self-signed, so you may need to accept a browser warning.
All services are configured to restart automatically unless stopped manually.
For debugging, check container logs with:
```bash

docker-compose logs <service_name>
```
