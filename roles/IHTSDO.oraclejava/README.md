openjdk role
============

This role installs the Oracle Java JDK on Ubuntu

Variables
---------

* **oraclejava_version** The major version of Java to install. Either 6 or 7 at the time of writing. Defaults to 7.
* **oraclejava_default** The java version to assign as OS default. Defaults to 7

Examples
--------

```yaml
---
  roles:
    - { role: IHTSDO.oraclejava, oraclejava_version: 7 }
```
