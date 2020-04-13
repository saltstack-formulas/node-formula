# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

node-package-archive-clean-file-absent:
  file.absent:
    - names:
      - {{ node.pkg.archive.name }}
           {%- if node.linux.altpriority|int == 0 and node.kernel in ('linux', 'darwin') %}
      - {{ node.dir.archive }}/bin/node
      - {{ node.dir.archive }}/bin/npm
      - {{ node.dir.archive }}/bin/npx
           {%- endif %}
