# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: !!str 24.22.2
  pkg:
    use_upstream_source: true
    source:
      uri: https://github.com/nodejs/node/archive
      source_hash: 06e6ffeeb91a6960fedf41b69d73b7aa55820803a27e8698e48f17b87c175cb8

  config:
    prefix: '/home/vagrant/.npm-packages'
  environ:
    a: b
