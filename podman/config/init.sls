# -*- coding: utf-8 -*-
# vim: ft=sls

{% if grains['os_family'] == 'RedHat' %}
include:
  - .rootless
  - .selinux.podman
  - .selinux.saltstack
{% endif %}
