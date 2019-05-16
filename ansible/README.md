# Maintain with Ansible

Ansible is used to install, configure and maintain the entire demo server.

## Install required Roles

Here in local dir `roles` :

```

mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```


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
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,pygeoapi
ansible-playbook -vv deploy.yml  -i hosts/demo.pygeoapi.io  --tags update,traefik

# Status
ansible-playbook -vv service.yml  -i hosts/demo.pygeoapi.io  --tags status

```

## Backup/Restore

```

# list backups
ansible-playbook -vv backup.yml -i hosts/demo.pygeoapi.io  --tags list

# Backup all
ansible-playbook -vv backup.yml -i hosts/demo.pygeoapi.io  --tags backup_all

# Restore
ansible-playbook -vv backup.yml -i hosts/demo.pygeoapi.io  --tags restore --extra-vars "db=ghc_smartem_postgis f=/backup/2019/01/ghc_smartem_postgis-190108-2300.sql.gz"

# copy remote file to local: backup/test/pygeoapi_postgis-190108-2300.sql.gz
# ./restore.sh [test|prod] [db container] [local file]
# Example ./restore.sh test pygeoapi_postgis pygeoapi_postgis-190108-2300.sql.gz

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
