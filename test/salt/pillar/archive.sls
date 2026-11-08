# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: !!str 24.22.2
  pkg:
    use_upstream_archive: true    # from NodeSource
    archive:
      uri: https://nodejs.org/dist
      source_hash: 4dd79de8cdc85d65cb32f48a75aee1067bf00bf94b96ecc8e4c2f82f6f0272c2

  config:
    prefix: '/home/vagrant/.npm-packages'
  environ:
    a: b
