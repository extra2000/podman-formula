# -*- coding: utf-8 -*-
# vim: ft=sls

{% if grains['os'] == 'Ubuntu' %}
  {% set reponame = 'xUbuntu_' + grains['osrelease']|string %}
{% elif grains['os'] == 'Debian' %}
  {% set reponame = 'Debian_' + grains['osrelease']|string %}
{% endif %}

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
