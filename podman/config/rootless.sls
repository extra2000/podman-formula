# -*- coding: utf-8 -*-
# vim: ft=sls

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
    - text: "{{ pillar['podman']['username'] }}:100000:65536"

/etc/subgid:
  file.append:
    - text: "{{ pillar['podman']['username'] }}:100000:65536"

# This fixes "there might not be enough IDs available in the namespace" error when pulling image.
# Credits to https://github.com/containers/podman/issues/3421#issuecomment-544455837
# Also the "podman system migrate" command should be executed from a login user by using sudo su,
# otherwise the command either fail or stuck when being executed by Salt daemon.
apply-subuid-and-subgid-changes:
  cmd.run:
    - name: sudo su -l {{ pillar['podman']['username'] }} -c 'sleep 10 && podman system migrate'
    - runas: {{ pillar['podman']['username'] }}

enable-linger-for-a-nonroot-user:
  cmd.run:
    - name: loginctl enable-linger {{ pillar['podman']['username'] }}
