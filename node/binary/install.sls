# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node as node with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

node-package-binary-install:
  file.directory:
    - name: {{ node.pkg.binary.name }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - mode: 755
    - makedirs: True
    - clean: True
    - require_in:
      - archive: node-package-binary-install
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(node.pkg.binary) }}
    - retry: {{ node.retry_option }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - recurse:
        - user
        - group
    - require:
      - file: node-package-binary-install

    {%- if node.linux.altpriority|int == 0 %}
        {%- for cmd in ('node', 'npx', 'npm',) %}

node-binary-install-file-symlink-{{ cmd }}:
  file.symlink:
    - name: /usr/local/bin/{{ cmd }}
    - target: {{ node.pkg.binary.name }}/bin/{{ cmd }}
    - force: True
    - onlyif: {{ node.kernel not in ('windows',) }}
    - require:
      - archive: node-package-binary-install
        {%- endfor %}
    {%- endif %}
