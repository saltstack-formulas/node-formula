# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

node-package-source-clean-file-absent:
  file.absent:
    - names:
      - {{ node.pkg.source.name }}*
      - {{ node.dir.source }}/node-{{ node.version }}
  pkg.removed:
    - names:
      - node-{{ node.version }}
      - node-{{ node.version }}-1
