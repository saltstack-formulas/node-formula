# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node as node with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

node-package-archive-install:
  pkg.installed:
    - names:
      - tar
      - gzip
    - require_in:
      - file: node-package-archive-install
  file.directory:
    - name: {{ node.pkg.archive.name }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - mode: 755
    - makedirs: True
    - clean: True
    - require_in:
      - archive: node-package-archive-install
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(node.pkg.archive) }}
    - retry: {{ node.retry_option }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - recurse:
        - user
        - group
    - require:
      - file: node-package-archive-install

    {%- if node.linux.altpriority|int == 0 %}
        {%- for cmd in ('node', 'npx', 'npm',) %}

node-archive-install-file-symlink-{{ cmd }}:
  file.symlink:
    - name: /usr/local/bin/{{ cmd }}
    - target: {{ node.pkg.archive.name }}/bin/{{ cmd }}
    - force: True
    - onlyif: {{ node.kernel not in ('windows',) }}
    - require:
      - archive: node-package-archive-install
        {%- endfor %}
    {%- endif %}
