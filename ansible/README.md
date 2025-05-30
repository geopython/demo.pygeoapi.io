# Maintain with Ansible

Ansible is used to install, configure and maintain the entire demo server.

## Install required Roles

Here in local dir `roles` :

```

mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```

## Make credentials files

These are not in this repo for obvious reasons... You need to create/populate these locally. 

* vars/vars.yml (see [example](vars/vars.example.yml))
* dockerhub env file in service/dockerhub/docker.env (see [example](../services/dockerhub/dockerhub.example.env))


## Bootstrap

```

# Installs entire system
ansible-playbook -vv bootstrap.yml -i hosts/demo.pygeoapi.io

```


Login.

```

ssh <admin user>@demo.pygeoapi.io

```

## Service

```

# System pygeoapi service
ansible-playbook -vv service.yml  -i hosts/demo.pygeoapi.io  --tags start
ansible-playbook -vv service.yml  -i hosts/demo.pygeoapi.io  --tags stop
ansible-playbook -vv service.yml  -i hosts/demo.pygeoapi.io  --tags status


```

## Deploy

Uses admin user account as configured in `vars/vars.yml`.


```

# Update git and deploy a service
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,home
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,dockerhub
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,pygeoapi_master
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,pygeoapi_stable
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,pygeoapi_cite
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,pygeoapi_covid-19
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,traefik

# Status
ansible-playbook -vv service.yml  -i hosts/demo.pygeoapi.io  --tags status

```

## Git Management

Manage the Git folder on the remote server with git commands. This way one can switch branches remotely via Ansible.

```
ansible-playbook -v git.yml -i hosts/demo.pygeoapi.io --tags status

# Switch to branch called 'traefik'
ansible-playbook -v git.yml -i hosts/demo.pygeoapi.io --tags checkout --extra-vars "branch=traefik"

# Switch to branch master (default)
ansible-playbook -v git.yml -i hosts/demo.pygeoapi.io --tags checkout

```

## Other

```

# Hosts affected 
$ ansible-playbook -vv bootstrap.yml --list-hosts

# Hosts affected via -l param
$ ansible-playbook -vv bootstrap.yml -l ansible2 --list-hosts

# Local hosts file
ansible-playbook -vv bootstrap.yml -i hosts/demo.pygeoapi.io  --list-hosts

```
