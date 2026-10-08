# Automated CI/CD Deployment of a Containerized Spring Boot Application on AWS

A DevOps project demonstrating an automated CI/CD pipeline for building, containerizing, and deploying a Java Spring Boot application to an AWS EC2 server.

## Project Overview

This project uses GitHub Actions to automatically build and package a Spring Boot application with Maven, create a Docker image, publish the image to GitHub Container Registry (GHCR), and deploy the latest containerized application to an AWS EC2 instance.

Whenever code is pushed to the `master` branch, the CI/CD pipeline is triggered automatically.

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions
    |
    +----> Maven Build
    |
    +----> Docker Build
    |
    v
GitHub Container Registry
    |
    v
AWS EC2
    |
    v
Docker Container
    |
    v
Live Spring Boot Application
```

## Technologies Used

* Java 21
* Spring Boot
* Maven
* Git
* GitHub
* GitHub Actions
* Docker
* GitHub Container Registry (GHCR)
* AWS EC2
* Linux

## CI/CD Pipeline

The project uses GitHub Actions to automate the application build and deployment process.

### Pipeline Flow

1. Developer pushes code to the `master` branch.
2. GitHub Actions automatically starts the workflow.
3. The Spring Boot application is built using Maven.
4. A Docker image is created from the application.
5. The Docker image is pushed to GitHub Container Registry.
6. GitHub Actions connects securely to the AWS EC2 instance.
7. The latest Docker image is pulled onto the EC2 server.
8. The previous application container is stopped and removed.
9. A new container is started with the latest application image.
10. The updated application becomes available through the EC2 server.

### Deployment Result

A code change pushed to GitHub can automatically reach the live application on AWS without manually rebuilding and deploying the application on the EC2 server.

## Running the Application Locally

### Prerequisites

Make sure the following are installed:

* Java 21
* Maven
* Git
* Docker

### Run with Maven

Clone the repository and navigate into the project directory:

```bash
git clone https://github.com/supriya19-dev/devops-app.git
cd devops-app
```

Build the application:

```bash
mvnw clean package
```

Run the Spring Boot application:

```bash
mvnw spring-boot:run
```

The application will be available at:

```text
http://localhost:8080
```

### Run with Docker

Build the application first:

```bash
mvnw clean package
```

Build the Docker image:

```bash
docker build -t devops-app .
```

Run the container:

```bash
docker run -d -p 8080:8080 --name devops-app-container devops-app
```

The application will then be available at:

```text
http://localhost:8080
```

## AWS Deployment

The application is deployed on an Amazon EC2 instance running Amazon Linux.

### Deployment Environment

* Cloud Provider: AWS
* Service: EC2
* Operating System: Amazon Linux 2023
* Container Runtime: Docker
* Application Port: 8080

The Docker container runs the Spring Boot application on the EC2 instance and exposes the application through port `8080`.

### Automated Deployment

GitHub Actions connects to the EC2 instance after successfully building and publishing the Docker image.

The deployment process:

```text
GitHub Actions
      |
      v
GHCR Docker Image
      |
      v
AWS EC2
      |
      +--> Pull latest image
      |
      +--> Stop old container
      |
      +--> Remove old container
      |
      +--> Start new container
      |
      v
Updated Application
```

This allows the application running on EC2 to be updated automatically whenever new code is pushed to the `master` branch.

## Project Highlights

* Automated CI/CD pipeline using GitHub Actions
* Maven-based Spring Boot application build
* Dockerized application for consistent deployment
* Docker image published to GitHub Container Registry
* Automated deployment to AWS EC2
* Automatic container replacement on every successful deployment
* Live application accessible from the AWS EC2 instance
* Version-controlled source code using Git and GitHub

## Key Learning Outcomes

Through this project, I gained practical experience with:

* Building and packaging Java applications with Maven
* Creating and running Docker containers
* Designing a CI/CD workflow with GitHub Actions
* Publishing container images using GitHub Container Registry
* Deploying containerized applications on AWS EC2
* Working with Linux and Docker on a cloud server
* Managing Git repositories and automated deployments

