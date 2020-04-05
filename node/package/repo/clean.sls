# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

node-package-repo-pkgrepo-absent:
  pkgrepo.absent:
    - name: {{ node.pkg.repo.name }}
    - onlyif: {{ node.pkg.repo and node.pkg.use_upstream_repo }}
