{% set pillar_get = salt['pillar.get'] -%}
include:
{%- if pillar_get('node:install_from_source') %}
  - .source
{%- elif pillar_get('node:install_from_binary') %}
  - .binary
{%- else %}
  - .pkg
{%- endif %}
  - .config
