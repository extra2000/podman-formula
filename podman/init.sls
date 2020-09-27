# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .package
  - .config
  - .subcomponent.podman-compose
  {% if grains['os'] == 'CentOS' %}
  - .subcomponent.dnsname
  {% endif %}
