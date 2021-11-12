# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 16.13.0
  pkg:
    use_upstream_source: true
    source:
      uri: https://github.com/nodejs/node/archive
      source_hash: f0327e99f730bf2506a1f13dbd452ec80b33667a7ce1c77a2dacd6babc8643c7

  config:
    prefix: '/home/vagrant/.npm-packages'
  environ:
    a: b
