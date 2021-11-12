# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 16.13.0
  pkg:
    use_upstream_archive: true    # from NodeSource
    archive:
      uri: https://nodejs.org/dist
      source_hash: 9c00e5b6024cfcbc9105f9c58cf160762e78659a345d100c5bd80a7fb38c684f

  config:
    prefix: '/home/vagrant/.npm-packages'
  environ:
    a: b
