# -*- coding: utf-8 -*-
# vim: ft=sls

/etc/sysctl.d/01-max-user-namespaces.conf:
  file.append:
    - text: "user.max_user_namespaces=10000"

set-max-user-namespaces-now:
  cmd.run:
    - name: echo "10000" > /proc/sys/user/max_user_namespaces

/etc/subuid:
  file.append:
    - text: "{{ pillar['podman']['username'] }}:100000:65536"

/etc/subgid:
  file.append:
    - text: "{{ pillar['podman']['username'] }}:100000:65536"