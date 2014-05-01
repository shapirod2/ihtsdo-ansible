openjdk role
============

This role installs the OpenJDK and/or JRE on Ubuntu and Debian.

Variables
---------

* **java_version** The major version of Java to install. Either 6 or 7 at the time of writing. Defaults to 7.
* **java_type** 'jre' or 'jdk'. Default to 'jdk'
* **java_default** The java version to assign as OS default. Defaults to 7

Examples
--------

```yaml
---
  roles:
    - { role: openjdk, java_version: 7 }
```
