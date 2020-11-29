# -*- coding: utf-8 -*-
# vim: ft=sls

registries-conf-present:
  file.managed:
    - name: /etc/containers/registries.conf
    - source: salt://podman/files/registries.conf
