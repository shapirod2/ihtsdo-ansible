Sonatype Nexus installer
========================

This role installs and upgrades Sonatype Nexus on Ubuntu and Debian. Optionally,
configured nginx to proxy either HTTP or HTTPS requests.

Variables
----------

* **sonatype_nexus_version** Version to install, e.g. 2.8.0. Defaults to 'latest'
* **sonatype_nexus_application_port** Port for the app to listen on. Defaults to '8081'
* **sonatype_nexus_application_host** IP address to listen. Defaults to '0.0.0.0'
* **sonatype_nexus_pid_dir** PIDDIR. Defaults to '/var/run/sonatype-nexus'
* **sonatype_nexus_work_dir** Work directory. Defaults to '/var/lib/sonatype-nexus'
* **sonatype_nexus_webapp_context_path** Set the Nexus context path. Defaults to /nexus

For nginx configuration:

* **sonatype_nexus_nginx_fqdn** The FQDN used to access nexus via the web server
* **sonatype_nexus_nginx_default_site** Boolean. If true, sets the nginx vhost to be the default site.
* **sonatype_nexus_nginx_ssl** Boolean. True to enable SSL.
* **sonatype_nexus_nginx_ssl_cert_file**. Location of the SSL certificate.
* **sonatype_nexus_nginx_ssl_key_file**. Location of the SSL key.

Apt plugin:

* **sonatype_nexus_plugin_apt_version** If set, install the nexus apt plugin. Needs to be a version of the plugin (e.g. 1.0.0)
* **sonatype_nexus_pkg_signing_key** If defined, the location of the apt pkg signing key. Installed to
{{ sonatype_nexus_work_dir }}/pkg_signing_gpg.keyring

Examples
--------

```yaml
- { role: sonatype-nexus, sonatype_nexus_port: 8080 }
```

License
-------

MIT
