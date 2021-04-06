# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

    {%- if grains.os_family not in ('Windows', 'MacOS',) %}
           {%- set p = node.pkg %}

include:
  - {{ '.source' if p.use_upstream_source else '.archive' if p.use_upstream_archive else '.package' }}
  - .config

    {%- else %}

node-not-available-to-install:
  test.show_notification:
    - text: |
        The node package is unavailable on {{ salt['grains.get']('osfinger', grains.os_family) }}

    {%- endif %}
