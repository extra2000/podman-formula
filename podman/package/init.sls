# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  {% if grains['os_family'] == 'RedHat' or grains['os_family'] == 'Suse' %}
  - .built-in
  {% else %}
  - .kubic
  {% endif %}
