# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PODMAN with context %}

{% set reponame = 'xUbuntu_' + grains['osrelease']|string %}

kubic-libcontainer-repo:
  pkgrepo.managed:
    - name: "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/{{ reponame }}/ /"
    - file: /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
    - gpgcheck: 1
    - key_url: https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/{{ reponame }}/Release.key
    - retry:
        attempts: 30
        until: True
        interval: 5
        splay: 1
podman:
  pkg.installed:
    - require:
      - pkgrepo: kubic-libcontainer-repo
