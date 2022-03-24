# -*- coding: utf-8 -*-
# vim: ft=yaml
---
node:
  version: 16.13.0
  config:
    # yamllint disable-line rule:line-length
    prefix: '{{ "${APPDATA}\\npm" if grains.os == "Windows" else "/home/vagrant/.npm-packages" }}'
  environ:
    a: b
  pkg:
    use_upstream_repo: false
    use_upstream_archive: false
    use_upstream_source: false
    archive:
      uri: https://nodejs.org/dist
      source_hash: 9c00e5b6024cfcbc9105f9c58cf160762e78659a345d100c5bd80a7fb38c684f
    source:
      uri: https://github.com/nodejs/node/archive
      source_hash: f0327e99f730bf2506a1f13dbd452ec80b33667a7ce1c77a2dacd6babc8643c7
