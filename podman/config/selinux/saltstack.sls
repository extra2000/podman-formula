# -*- coding: utf-8 -*-
# vim: ft=sls

/tmp/selinux-saltstack/saltstack.te:
  file.managed:
    - source: salt://podman/files/saltstack.te
    - makedirs: true
    - force: true

build_selinux_saltstack_te_into_module:
  cmd.run:
    - name: checkmodule -M -m -o saltstack.mod saltstack.te
    - cwd: /tmp/selinux-saltstack

build_saltstack_te_module_into_pp_file:
  cmd.run:
    - name: semodule_package -o saltstack.pp -m saltstack.mod
    - cwd: /tmp/selinux-saltstack
  
remove_existing_saltstack_policy:
  cmd.run:
    - name: semodule -r saltstack
    - success_retcodes:
      - "0"
      - "1"

load_saltstack_pp_file:
  cmd.run:
    - name: semodule -i saltstack.pp
    - cwd: /tmp/selinux-saltstack
