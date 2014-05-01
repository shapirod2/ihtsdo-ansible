# IHTSDO Ansible code repository

The tree contains Ansible code to build and manage the various IHTSDO services.

# Getting started

Before using the repository, you need to configure the files path, and, optionally the inventory path. There is an ansible playbook that will do this for you. By default it expects the inventory and files directories to b in ../ansible-inventory

```sh
$ ansible-playbook -i .local.ini configure_ansible_paths.yml
```

This will point inventory and files symlink to ../ansible-inventory/inventory and ../ansible-inventory/files. To use a different location:

```sh
$ ansible-playbook -i .local.ini configure_ansible_paths -e inventory_path=<your_inventory_location>
```

Note that your_inventory_location must contain directories files and inventory containing files used by the various modules and the inventory files


