{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '5.1.0') -%}
{% set checksum = node.get('checksum', '25b2d3b7dd57fe47a483539fea240a3c6bbbdab4d89a45a812134cf1380ecb94') -%}
{% set make_jobs = node.get('make_jobs', '1') -%}

# Get the node.js version to find out if we have to install it again.
# Checkinstall appends -1 as revision number, so remove it if found.
{% set nodeVersion = salt['pkg.version']('node')|replace('-1', '') -%}


{% if nodeVersion != version %}

Ensure required packages are present:
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

Download node sources:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source: http://nodejs.org/dist/v{{ version }}/node-v{{ version }}.tar.gz
    - source_hash: sha256={{ checksum }}
    - require:
      - pkg: Ensure required packages are present

Extract sources:
  cmd.run:
    - cwd: /usr/src
    - name: tar -zxvf node-v{{ version }}.tar.gz
    - require:
      - file: Download node sources

configure-node:
  cmd.run:
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
    - onchanges:
      - cmd: make-node

{% endif %}