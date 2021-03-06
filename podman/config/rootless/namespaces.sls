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
