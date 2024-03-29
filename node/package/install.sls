# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

    {%- if node.pkg.repo and node.pkg.use_upstream_repo %}

include:
  - node.package.repo  # full path for legacy symlink

    {%- endif %}

node-package-install-pkg-installed:
  pkg.installed:
    - name: {{ node.pkg.name }}
    - reload_modules: true
        {%- if node.pkg.version is defined %}
    - version: {{ node.pkg.version }}
        {%- endif %}
