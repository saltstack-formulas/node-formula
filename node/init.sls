{% set pillar_get = salt['pillar.get'] -%}
include:
{%- if pillar_get('node:install_from_source') %}
  - .source
{%- else %}
  - .pkg
{%- endif %}
