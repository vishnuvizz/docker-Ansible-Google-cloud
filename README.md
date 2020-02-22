# info
This repo is created with a sample go application deployed as a microservices in containers using Docker by provisioning an compute engine instance in Google Cloud Platform.



## Description 

This is a sample `Go` application which connects to Redis. The app increments a `counter` on an incoming request.

### Setting up the app
- Use `make build` to compile the binary.
- Set the environment variables:
    - `DEMO_APP_ADDR`: Address where the app should listen to
    - `DEMO_REDIS_ADDR`: Address where Redis is running

## Tasks

- Create a `Dockerfile` for the app.

- Create a `docker-compose.yml` for the app which includes

  - `redis` service, with the data directory of `redis` mounted at `/data` in your VM.
  - `app` service running with port `8000` exposed to the host.

- Write a bash script that creates and boots [Vagrant box](https://vagrant.io) with Ubuntu.

- Using Ansible provision the VM to:

  - Setup hostname of VM as `demo-ops`
  - Create a user `demo`
  - Configure `sysctl` for sane defaults. For eg: increasing open files limit. Configure a variety of `sysctl` settings to make the VM a production grade one.
  - Set the system's timezone to "Asia/Kolkata"
  - Install Docker and Docker-Compose
  - Configure Docker Daemon to have sane defaults. For eg: to keep logs size in check.
  - Deploy the `docker-compose.yml` in `/etc/demo-ops` and start the services
---
.







.


## Deployment method: 

### Below is bird's-eye view of this setup:
[Go application & redis] << docker-compose << Docker << Compute Engine << Ansible & Vagrant << Google Cloud Platform.

### Dependencies:
  - python >= 2.6
  - google-auth >= 1.3.0
  - ruby
  - Vagrant
  - Ansible
Created and added SSH public keys to GCP project metadata
Created service account with a JSON key.

## Details of scripts used for deployment: 
1. I choose GCP to deploy this application.
2. For server deployment I have two options - any one can be used:
      - One using vagrant - bash script (`gcp_instance_vagrant.sh`)
      - Other using Ansible - (`gcp_instance.yml`) - BONUS
3. Provisioning server with ansible - basically configuring server - (`gcp_post_deployment.yml`)
4. Attached `Dockerfile` created for application.
5. Attached `docker-compose.yml` will build image and deploy application as container in the provisioned server (`demo-ops`). 
 
 


## FINAL OUTPUT:
```
e_vishnu55@demo-ops:~$ curl http://localhost:8000 
welcome to api 1
e_vishnu55@demo-ops:~$ curl http://localhost:8000 
welcome to api 2
e_vishnu55@demo-ops:~$ curl http://localhost:8000 
welcome to api 3
e_vishnu55@demo-ops:~$
```
