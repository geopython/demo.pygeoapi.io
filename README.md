# demo.pygeoapi.io server setup

Demo setup for https://demo.pygeoapi.io. Includes Ansible playbooks for bootstrapping (provisioning)
an empty Ubuntu server, installing all (Docker) services.

## Common setup with Ansible

```

# get code
git clone https://github.com/geopython/demo.pygeoapi.io

# Get required Ansible roles/modules, install locally
cd ansible
mkdir roles
ansible-galaxy install --roles-path ./roles -r requirements.yml

```

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

