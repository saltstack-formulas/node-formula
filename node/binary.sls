{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '5.4.0') -%}
{% set checksum = node.get('checksum', 'sha256=f037e2734f52b9de63e6d4a4e80756477b843e6f106e0be05591a16b71ec2bd0') -%}
{% if grains.get('osarch', {}) == 'armhf' -%}
{% set arch = 'armv7l' -%}
{% else -%}
{% set arch = 'x64' -%}
{% endif -%}
{% set pkgname = 'node-v' ~ version ~ '-linux-' ~ arch -%}
{% set format = node.get('format', 'gz') -%}

Extract binary package:
  archive.extracted:
    - name: /usr/local/src/
    - source: https://nodejs.org/dist/v{{ version }}/{{ pkgname }}.tar.{{ format }}
    - source_hash: {{ checksum }}
    - archive_format: tar
    - if_missing: /usr/local/src/{{ pkgname }}

Copy lib:
  cmd.run:
    - cwd: /usr/local/src/{{ pkgname }}/
    - name: cp -r bin/ include/ lib/ share/ /usr/local/
    - unless: cmp /usr/local/bin/node /usr/local/src/{{ pkgname }}/bin/node
