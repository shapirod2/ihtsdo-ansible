# Openssh configuration role

This role installed and configures the openssh server.

## Usage

You can just include the role without any configuration and sshd will be
configured with default values:

    ...
    roles:
      - sshd

However, this role allows almost every sshd configuration option present in
ssh_config to be changed. The variable names are of the form
sshd_variable_name, for example `sshd_permit_root_login`. Take a look at
`defaults/main.yml` for a full list of variables that can be configured.

A good example configuration to use (just place these into your
`group_vars/groupname` file or wherever you are setting variables) would be:

    sshd_permit_root_login: "no"
    sshd_password_authentication: "no"
    sshd_allow_tcp_forwarding: "no"

Note that if you put 'yes' or 'no' as the value for a configuration option, it
must be enclosed in quotes, otherwise ansible will interpret it as a boolean
and put an incorrect value in the configuration file.
