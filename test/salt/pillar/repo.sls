# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: !!str 24.22.2
  pkg:
    use_upstream_repo: true    # Debian family only
  config:
    prefix: /home/vagrant/.npm-packages
  environ:
    a: b
