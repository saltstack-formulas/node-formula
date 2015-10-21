{% from "node/map.jinja" import npmrc with context %}
{% set config = salt['pillar.get']('npm:config') %}
{% if config %}
{{ npmrc }}:
  file.managed:
    - source: salt://node/files/npmrc.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        config: {{ config|json() }}
{% endif %}
