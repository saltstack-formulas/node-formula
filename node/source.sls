{% set node = pillar.get('node', {}) -%}
{% set version = node.get('version', '0.8.20') -%}
{% set checksum = node.get('checksum', 'b780f58f0e3bc43d2380d4a935f2b45350783b37') -%}
{% set make_jobs = node.get('make_jobs', '1') -%}

{% if grains['os_family'] == 'RedHat' %}
git_packages:
  pkg.installed:
    - names:
      - git
      - gcc-c++
      - make
      - openssl-devel
{% endif %}

{% if grains['os_family'] == 'Debian' %}
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
{% endif %}

## Get Node
get-node:
  file.managed:
    - name: /usr/src/node-v{{ version }}.tar.gz
    - source: http://nodejs.org/dist/v{{ version }}/node-v{{ version }}.tar.gz
    - source_hash: sha1={{ checksum }}
    - require:
      - pkg: git_packages
  cmd.wait:
    - cwd: /usr/src
    - names:
      - tar -zxvf node-v{{ version }}.tar.gz
    - watch:
      - file: /usr/src/node-v{{ version }}.tar.gz

make-node:
  cmd.wait:
    - cwd: /usr/src/node-v{{ version }}
    - names:
      - ./configure && make && make install
    - watch:
      - cmd: get-node

/usr/bin/node:
  file.symlink:
    - target: /usr/local/bin/node
    - require:
      - cmd: make-node

/usr/bin/npm:
  file.symlink:
    - target: /usr/local/bin/npm
    - require:
      - cmd: make-node
