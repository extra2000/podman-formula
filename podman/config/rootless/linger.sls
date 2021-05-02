# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PODMAN with context %}

enable-linger-for-a-nonroot-user:
  cmd.run:
    - name: loginctl enable-linger {{ PODMAN.hostuser.name }}
