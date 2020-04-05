# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

node-package-source-install:
      {%- if node.pkg.deps %}
  pkg.installed:
    - names: {{ node.pkg.deps }}
    - require_in:
      - file: node-package-source-install
      {%- endif %}
  file.directory:
    - name: {{ node.pkg.source.name }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - mode: 755
    - clean: True
    - makedirs: True
    - require_in:
      - source: node-package-source-install
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(node.pkg.source) }}
    - retry: {{ node.retry_option }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - recurse:
        - user
        - group
    - require:
      - file: node-package-source-install
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - names:
      - ./configure
      - make -j 4
    - require:
      - archive: node-package-source-install

    {% if grains.os_family in ('RedHat',) %}

node-package-source-install-make:
  gem.installed:
    - name: fpm
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - names:
      - make install DESTDIR=./tmp
      - fpm -s dir -t rpm -C ./tmp -n node -v {{ node.version }} --iteration 1 --description "Node v{{ node.version }} (fpm)" -f
    - onchanges:
      - cmd: node-package-source-install
  pkg.installed:
    - sources:
      - node: {{ node.dir.source }}/node-{{ node.version }}/node-{{ node.version }}-1.x86_64.rpm
    - onchanges:
      - cmd: node-package-source-install-make

    {% else %}

node-package-source-install-checkinstall:
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - name: checkinstall --install=yes --pkgname=node --pkgversion "{{ node.version }}" --default
    - onchanges:
      - cmd: node-package-source-install

    {% endif %}
