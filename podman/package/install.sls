# -*- coding: utf-8 -*-
# vim: ft=sls

podman-prerequisites:
  pkg.installed:
    - pkgs:
      - dnsmasq
      - jq

{% if grains['os'] == 'Ubuntu' %}
kubic-libcontainer-repo:
  pkgrepo.managed:
    - humanname: Google Chrome
    - name: "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_{{ grains['osrelease'] }}/ /"
    - file: /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
    - gpgcheck: 1
    - key_url: https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_{{ grains['osrelease'] }}/Release.key
podman:
  pkg.installed:
    - require:
      - pkgrepo: kubic-libcontainer-repo
{% else %}
podman:
  pkg.installed
{% endif %}
