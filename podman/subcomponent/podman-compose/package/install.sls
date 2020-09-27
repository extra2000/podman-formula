# -*- coding: utf-8 -*-
# vim: ft=sls

prerequisites:
  pkg.installed:
    - pkgs:
      - git
      - python3-pip

pyyaml:
  pip.installed:
    - name: PyYAML
    - bin_env: '/usr/bin/pip3'

podman-compose:
  pip.installed:
    - name: git+https://github.com/containers/podman-compose@master
    - bin_env: '/usr/bin/pip3'
    - pip: pyyaml

/usr/bin/podman-compose:
  file.symlink:
    - target: /usr/local/bin/podman-compose
    - force: true
    - require:
      - pip: podman-compose
