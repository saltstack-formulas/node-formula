# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  pkg:
    use_upstream_repo: true    # Debian family only
  config:
    prefix: ${HOME}/.npm-packages
  environ:
    a: b
