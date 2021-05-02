# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PODMAN with context %}

/home/{{ PODMAN.hostuser.name }}/.config/systemd/user/default.target.wants:
  file.directory:
    - user: {{ PODMAN.hostuser.name }}
    - group: {{ PODMAN.hostuser.name }}
    - makedirs: true

/home/{{ PODMAN.hostuser.name }}/.config/systemd/user/multi-user.target.wants:
  file.directory:
    - user: {{ PODMAN.hostuser.name }}
    - group: {{ PODMAN.hostuser.name }}
    - makedirs: true

## Ensure "rootless-cni-infra" is removed at startup, to prevent issues when starting rootless pods.
/home/{{ PODMAN.hostuser.name }}/.config/systemd/user/remove-rootless-cni-infra.service:
  file.managed:
    - source: salt://podman/files/remove-rootless-cni-infra.service
    - user: {{ PODMAN.hostuser.name }}
    - group: {{ PODMAN.hostuser.name }}

/home/{{ PODMAN.hostuser.name }}/.config/systemd/user/default.target.wants/remove-rootless-cni-infra.service:
  file.symlink:
    - target: /home/{{ PODMAN.hostuser.name }}/.config/systemd/user/remove-rootless-cni-infra.service

/home/{{ PODMAN.hostuser.name }}/.config/systemd/user/multi-user.target.wants/remove-rootless-cni-infra.service:
  file.symlink:
    - target: /home/{{ PODMAN.hostuser.name }}/.config/systemd/user/remove-rootless-cni-infra.service
