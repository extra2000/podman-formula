# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  {% if grains['os_family'] == 'RedHat' %}
  - .selinux-utils
  {% endif %}
  - .built-in
