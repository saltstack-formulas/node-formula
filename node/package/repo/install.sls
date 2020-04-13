# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}
{%- from tplroot ~ "/macros.jinja" import format_kwargs with context %}

node-package-repo-pkgrepo-managed:
  pkgrepo.managed:
    {{- format_kwargs(node.pkg.repo) }}
    - onlyif: {{ node.pkg.repo and node.pkg.use_upstream_repo }}

