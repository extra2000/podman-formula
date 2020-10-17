# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .package
  - .config
  {% if grains['os'] == 'CentOS' %}
  - .subcomponent.dnsname
  {% endif %}
