# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 13.12.0
  pkg:
    use_upstream_source: true
    source:
      uri: https://github.com/nodejs/node/archive
      source_hash: 37aff6cc2f451d1dbe693d18ad87fad352ed4f74f7b8e232590dd7f2f6b5d525

  config:
    prefix: '${HOME}/.npm-packages'
  environ:
    a: b
