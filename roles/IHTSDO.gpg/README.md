GPG role
========

This role installs gnupg and can simply import GPG/PGP keys from a key server, given a key id.

Variables
---------

* gpg_key_server - address of a GPG key server, defaults to 'pgp.mit.edu'
* gpg_key_id - ID of the GPG to retrieve from the server. No default and if not set, just installs
GPG.

Examples
--------

```yaml
- hosts: all
  roles:
    - { role: gpg, gpg_key_id: FFDDEECCAA }
    - { role: gpg, gpg_key_id: AABBCCDDEE }
```


