# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 13.12.0
  pkg:
    use_upstream_binary: true    # from NodeSource
    binary:
      uri: https://nodejs.org/dist
      source_hash: 3e66b14bbeb9ea1ba129fae7c65374844f4ddaf1e48e2bc19b3b2570e158e362

  config:
    prefix: '${HOME}/.npm-packages'
  environ:
    a: b
