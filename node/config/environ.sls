# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- if 'environ' in node and node.environ %}

    {%- if node.pkg.use_upstream_source %}
        {%- set sls_package_install = tplroot ~ '.source.install' %}
    {%- elif node.pkg.use_upstream_archive %}
        {%- set sls_package_install = tplroot ~ '.archive.install' %}
    {%- else %}
        {%- set sls_package_install = tplroot ~ '.package.install' %}
    {%- endif %}
include:
  - {{ sls_package_install }}

node-config-file-file-managed-environ_file:
  file.managed:
    - name: {{ node.environ_file }}
    - source: {{ files_switch(['environ.sh.jinja'],
                              lookup='node-config-file-file-managed-environ_file'
                 )
              }}
    - mode: 640
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        environ: {{ node.environ|json }}
    - require:
      - sls: {{ sls_package_install }}

{%- endif %}
