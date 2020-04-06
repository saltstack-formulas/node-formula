# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 13.12.0
  config:
    prefix: '/home/vagrant/.npm-packages'
  environ:
    a: b
  pkg:
    use_upstream_repo: false
    use_upstream_archive: false
    use_upstream_source: false
    archive:
      uri: https://nodejs.org/dist
      source_hash: 3e66b14bbeb9ea1ba129fae7c65374844f4ddaf1e48e2bc19b3b2570e158e362
    source:
      uri: https://github.com/nodejs/node/archive
      source_hash: 37aff6cc2f451d1dbe693d18ad87fad352ed4f74f7b8e232590dd7f2f6b5d525
