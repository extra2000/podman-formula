# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .dnsname
{% if grains['os_family'] == 'RedHat' %}
  - .selinux.podman
  - .selinux.saltstack
{% endif %}
