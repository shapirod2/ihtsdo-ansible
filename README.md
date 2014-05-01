The tree contains Ansible code to build and manage the various IHTSDO services. It does not contain configuration data.

# Getting started

The default checkout of the repository assumes any local files and the inventory files are in ../ansible-inventory

If not, there is an ansible playbook that will repoint these symlinks for you.

```sh
$ ansible-playbook -i .local.ini configure_ansible_paths -e inventory_path=<your_inventory_location>
```

Note that your_inventory_location must contain directories files and inventory containing files used by the various modules and the inventory files

# Running playbooks

Playbooks are run in typical ansible fashion by passing the inventory file to use and naming the playbook.

```sh
$ ansible-playbook -i inventory/live.ini build-environment.yml
```

You can also specific the user to login as with -u <username>.

## SSH

Ansible uses SSH as a transports. These means you can use ~/.ssh/config to set connection defaults. It's useful to add lines such as 

```
Host *.ihtsdotools.org
  User myihtsdousername
```

to that file.

