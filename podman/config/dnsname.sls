# -*- coding: utf-8 -*-
# vim: ft=sls

add_domain_name_to_tmpfile:
  cmd.run:
    - name: jq '.plugins += [{"type":"dnsname","domainName":"local"}]' /etc/cni/net.d/87-podman-bridge.conflist > /tmp/87-podman-bridge.conflist.tmp
    - runas: {{ pillar['podman']['username'] }}

/etc/cni/net.d/87-podman-bridge.conflist:
  file.rename:
    - source: /tmp/87-podman-bridge.conflist.tmp
    - force: true
    - require:
      - cmd: add_domain_name_to_tmpfile
