# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .rootless
  {% if grains['os_family'] == 'Arch' %}
  - .registries
  {% endif %}
  {% if grains['os_family'] == 'RedHat' %}
  - .selinux.podman
  - .selinux.saltstack
  {% endif %}
