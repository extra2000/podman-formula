# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PODMAN with context %}

/tmp/selinux-podman/podman.te:
  file.managed:
    - source: salt://podman/files/podman.te
    - makedirs: true
    - force: true

build_selinux_podman_te_into_module:
  cmd.run:
    - name: checkmodule -M -m -o podman.mod podman.te
    - cwd: /tmp/selinux-podman

build_podman_te_module_into_pp_file:
  cmd.run:
    - name: semodule_package -o podman.pp -m podman.mod
    - cwd: /tmp/selinux-podman
  
remove_existing_podman_policy:
  cmd.run:
    - name: semodule -r podman
    - success_retcodes:
      - "0"
      - "1"

load_podman_pp_file:
  cmd.run:
    - name: semodule -i podman.pp
    - cwd: /tmp/selinux-podman
