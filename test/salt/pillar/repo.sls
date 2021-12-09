# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  pkg:
    use_upstream_repo: true    # Debian family only
    {%- if salt['grains.get']('osfinger') in ['Debian-9','Ubuntu-18.04'] %}
    version: 16.13.1-1nodesource1
    {%- endif %}
  config:
    prefix: /home/vagrant/.npm-packages
  environ:
    a: b
