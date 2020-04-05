# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

node-package-binary-clean-file-absent:
  file.absent:
    - names:
      - {{ node.pkg.binary.name }}
           {%- if node.linux.altpriority|int == 0 and node.kernel in ('linux', 'darwin') %}
      - {{ node.dir.binary }}/bin/node
      - {{ node.dir.binary }}/bin/npm
      - {{ node.dir.binary }}/bin/npx
           {%- endif %}
