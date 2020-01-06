# demo.pygeoapi.io server setup

Demo setup for https://demo.pygeoapi.io. Includes Ansible playbooks for bootstrapping (provisioning)
an empty Ubuntu server, installing all (Docker) services.

All services can be started/stopped as a Ubuntu system service named `pygeoapi` on the server as well.

## Services

The demo server runs the following apps/services:

* [home](services/home) - simple Flask app for landing page and demo viewers
* [pygeoapi_master](services/pygeoapi_master) - (latest GitHub `master` version of) `pygeoapi` service with test data
* [pygeoapi_stable](services/pygeoapi_stable) - (last stable version of) `pygeoapi` service with test data
* [pygeoapi_cite](services/pygeoapi_cite) - (latest GitHub `master` version of) `pygeoapi` service with CITE configuration
* [traefik](services/traefik) - edge/proxy server routing incoming HTTP(S) and managing SSL-certificates (via Let's Encrypt)
* [dockerhub listener](services/dockerhub) - listens to webhooks from DockerHub to redeploy [home](services/home) and [pygeoapi_master](services/pygeoapi_master)

## Auto Update 

The [home](services/home), [pygeoapi_master](services/pygeoapi_master) and [pygeoapi_cite](services/pygeoapi_cite)
services are automatically redeployed by [dockerhub listener](services/dockerhub). The full chain is:
 
```
 (git push to GitHub master) --> (DockerHub Image autobuild) --> (demo server redeploy by dockerhub listener)

```

The [home](services/home) app is redeployed after any git push to the `master` of this GitHub repo.

The [pygeoapi_master](services/pygeoapi_master) service is redeployed after any git push 
to the `master` of the [pygeoapi GitHub repo](https://github.com/geopython/pygeoapi).
 
The [pygeoapi_cite](services/pygeoapi_cite) service is redeployed after any git push 
to the `master` of the [pygeoapi GitHub repo](https://github.com/geopython/pygeoapi).
 
## Common setup with Ansible

```

# get code
git clone https://github.com/geopython/demo.pygeoapi.io

# Get required Ansible roles/modules, install locally
cd ansible
mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```

## Make credentials files

These are not in this repo for obvious reasons... You need to create/populate these locally. 

* `ansible/vars/vars.yml` (see [example](ansible/vars/vars.example.yml))
* `service/dockerhub/docker.env` dockerhub env file with your `TOKEN` set in DockerHub  (see [example](services/dockerhub/dockerhub.example.env))

## Remote Setup with Ansible.

Have a remote Ubuntu VM installed with root access via pub/private key.

```

# Installs entire system
cd ansible
ansible-playbook -vv bootstrap.yml -i hosts/demo.pygeoapi.io


```

## Local Setup with Ansible, Vagrant and VirtualBox

Have Ansible, Vagrant and VBox installed.

```

# Setup Vagrant with VirtualBox for Ubuntu 16.04 VM
cd demo.pygeoapi.io
vagrant box add geerlingguy/ubuntu1604
vagrant init geerlingguy/ubuntu1604

# Will use Vagrantfile for auto-provisioning via Ansible
vagrant up
vagrant ssh
vagrant halt

```

## Start stop services

All services can be started/stopped as a Ubuntu system service named `pygeoapi` as well.
Login as admin user and issue:

```

sudo service pygeoapi stop
sudo service pygeoapi start
sudo service pygeoapi status

```

