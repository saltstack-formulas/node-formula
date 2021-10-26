# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

{%- if 'config' in node and node.config %}

    {%- if node.pkg.use_upstream_source %}
        {%- set sls_package_clean = tplroot ~ '.source.clean' %}
    {%- elif node.pkg.use_upstream_archive %}
        {%- set sls_package_clean = tplroot ~ '.archive.clean' %}
    {%- else %}
        {%- set sls_package_clean = tplroot ~ '.package.clean' %}
    {%- endif %}
include:
  - {{ sls_package_clean }}

node-config-clean-file-absent:
  file.absent:
    - names:
      - {{ node.config_file }}
      - {{ node.environ_file }}
    - require:
      - sls: {{ sls_package_clean }}

{%- endif %}
