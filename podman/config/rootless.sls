# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PODMAN with context %}

/etc/sysctl.d/01-max-user-namespaces.conf:
  file.append:
    - text: "user.max_user_namespaces=10000"

set-max-user-namespaces-now:
  cmd.run:
    - name: echo "10000" > /proc/sys/user/max_user_namespaces

{% if grains['os_family'] == 'Debian' %}
allow-user-namespaces-clone:
  cmd.run:
    - name: echo "1" > /proc/sys/kernel/unprivileged_userns_clone
{% endif %}

/etc/subuid:
  file.append:
    - text: "{{ PODMAN.hostuser.name }}:100000:65536"

/etc/subgid:
  file.append:
    - text: "{{ PODMAN.hostuser.name }}:100000:65536"

# This fixes "there might not be enough IDs available in the namespace" error when pulling image.
# Credits to https://github.com/containers/podman/issues/3421#issuecomment-544455837
# Also the "podman system migrate" command should be executed from a login user by using sudo su,
# otherwise the command either fail or stuck when being executed by Salt daemon.
apply-subuid-and-subgid-changes:
  cmd.run:
    - name: sudo su -l {{ PODMAN.hostuser.name }} -c 'sleep 10 && podman system migrate'
    - runas: {{ PODMAN.hostuser.name }}

enable-linger-for-a-nonroot-user:
  cmd.run:
    - name: loginctl enable-linger {{ PODMAN.hostuser.name }}

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
