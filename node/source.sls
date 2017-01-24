{% from "node/map.jinja" import from_src_requirements with context %}

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
    - names: {{ from_src_requirements.pkgs|json }}

{% if grains['os_family'] in ['RedHat', 'CentOS'] %}
Alternative checkinstall requirement:
  pkg.installed:
    - pkgs:
      - ruby-devel
      - gcc

fpm:
  gem.installed:
    - user: root
{% endif %}

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

{% if grains['os_family'] in ['RedHat', 'CentOS'] %}
make-install-node:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - name: make install DESTDIR=/usr/src/node-v{{ version }}/tmp
    - onchanges:
      - cmd: make-node

fpm-node:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - name: fpm -s dir -t rpm -C /usr/src/node-v{{ version }}/tmp --name=node --version "{{ version }}" --iteration 1 --description "Node package v{{ version }} (fpm)" --force
    - onchanges:
      - cmd: make-install-node

install-node:
  pkg.installed:
    - sources:
      - node: /usr/src/node-v{{ version }}/node-{{ version }}-1.x86_64.rpm
    - onchanges:
      - cmd: fpm-node
{% else %}

install-node:
  cmd.run:
    - cwd: /usr/src/node-v{{ version }}
    - name: checkinstall --install=yes --pkgname=node --pkgversion "{{ version }}" --default
    - onchanges:
      - cmd: make-node

{% endif %}

{% else %}

Version Control:
  test.succeed_without_changes:
    - name: Node version {{ nodeVersion }} already installed

{% endif %}
