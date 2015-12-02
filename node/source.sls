{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '5.1.0') -%}
{% set checksum = node.get('checksum', '25b2d3b7dd57fe47a483539fea240a3c6bbbdab4d89a45a812134cf1380ecb94') -%}
{% set make_jobs = node.get('make_jobs', '1') -%}
git_packages:
  pkg.installed:
    - names:
      - libssl-dev
      - git
      - pkg-config
      - build-essential
      - curl
      - gcc
      - g++
      - checkinstall

## Get Node
get-node:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source: http://nodejs.org/dist/v{{ version }}/node-v{{ version }}.tar.gz
    - source_hash: sha256={{ checksum }}
    - require:
      - pkg: git_packages
  cmd.wait:
    - cwd: /usr/src
    - names:
      - tar -zxvf node-v{{ version }}.tar.gz
    - watch:
      - file: /usr/src/node-v{{ version }}.tar.gz

configure-node:
  cmd.run:
    #- unless: which node
    - cwd: /usr/src/node-v{{ version }}
    - ignore_timeout: True
    - name: ./configure

make-node:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - name: make --jobs={{ make_jobs }}

install-node:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - name: checkinstall --install=yes --pkgname=node --pkgversion "{{ version }}" --default

