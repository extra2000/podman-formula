# -*- coding: utf-8 -*-
# vim: ft=sls

dnsname-prerequisites:
  pkg.installed:
    - pkgs:
      - git
      - golang

https://github.com/containers/dnsname.git:
  git.latest:
    - target: /tmp/dnsname
    - rev: 955382b1c381d2982d1fb7fe7002d5b443c75f36
    - user: {{ pillar['podman']['username'] }}

build_podman_dnsname_plugin:
  cmd.run:
    - name: make
    - cwd: /tmp/dnsname
    - runas: {{ pillar['podman']['username'] }}
    - require:
      - git: https://github.com/containers/dnsname.git

install_podman_dnsname_plugin:
  cmd.run:
    - name: make install
    - cwd: /tmp/dnsname
    - require:
      - cmd: build_podman_dnsname_plugin

/usr/libexec/cni/dnsname:
  file.symlink:
    - target: /usr/local/libexec/cni/dnsname
    - force: true
    - require:
      - cmd: install_podman_dnsname_plugin
