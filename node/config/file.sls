# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- if 'config' in node and node.config %}

    {%- if node.pkg.use_upstream_source %}
        {%- set sls_package_install = tplroot ~ '.source.install' %}
    {%- elif node.pkg.use_upstream_archive %}
        {%- set sls_package_install = tplroot ~ '.archive.install' %}
    {%- else %}
        {%- set sls_package_install = tplroot ~ '.package.install' %}
    {%- endif %}
include:
  - {{ sls_package_install }}

node-config-npmrc-file-managed-config_file:
  file.managed:
    - name: {{ node.config_file }}
    - source: {{ files_switch(['npmrc.default.jinja'],
                              lookup='node-config-file-file-managed-config_file'
                 )
              }}
    - mode: 640
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        config: {{ node.config }}
    - require:
      - sls: {{ sls_package_install }}

{%- endif %}
