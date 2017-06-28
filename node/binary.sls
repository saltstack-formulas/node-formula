{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '6.10.0') -%}
{% set checksum = node.get('checksum', '20b144da9bc3c314abfb760e90580a94091037257fc0b2c32871bc29257f7545') -%}
{% if grains.get('osarch', {}) == 'armhf' -%}
{% set arch = 'armv7l' -%}
{% else -%}
{% set arch = 'x64' -%}
{% endif -%}
{% set pkgname = 'node-v' ~ version ~ '-linux-' ~ arch -%}
{% set format = node.get('format', 'gz') -%}
{% if format == 'xz' -%}
{% set tar_options = 'J' -%}
{% elif format == 'bz2' -%}
{% set tar_options = 'j' -%}
{% else -%}
{% set tar_options = 'z' -%}
{% endif -%}

Get binary package:
  file.managed:
    - name: /usr/local/src/{{ pkgname }}.tar.{{ format }}
    - source: https://nodejs.org/dist/v{{ version }}/{{ pkgname }}.tar.{{ format }}
    - source_hash: https://nodejs.org/dist/v{{ version }}/SHASUMS256.txt

Extract binary package:
  archive.extracted:
    - name: /usr/local/src/
    - source: /usr/local/src/{{ pkgname }}.tar.{{ format }}
    - archive_format: tar
    - options: {{ tar_options }}
    - if_missing: /usr/local/src/{{ pkgname }}
    - require:
      - file: Get binary package

Remove existing include directory:
  file.absent:
    - name: /usr/local/include/node
    - unless: cmp /usr/local/bin/node /usr/local/src/{{ pkgname }}/bin/node
    - require:
      - archive: Extract binary package

Remove existing npm:
  file.absent:
    - name: /usr/local/lib/node_modules/npm
    - onchanges:
      - file: Remove existing include directory

Copy lib:
  cmd.run:
    - cwd: /usr/local/src/{{ pkgname }}/
    - name: cp -r bin/ include/ lib/ share/ /usr/local/
    - unless:
      - cmp /usr/local/bin/node /usr/local/src/{{ pkgname }}/bin/node
      - npm --version
