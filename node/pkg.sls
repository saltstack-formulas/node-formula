{%- from "node/map.jinja" import node, npm_bin with context %}

{%- if grains['os'] == 'Ubuntu' and salt['pillar.get']('node:install_from_ppa') %}
nodejs.ppa:
  pkgrepo.managed:
    - humanname: node.js PPA
    - name: deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu {{ grains['oscodename'] }} main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/nodejs.list
    - keyid: "C7917B12"
    - keyserver: keyserver.ubuntu.com
    - require_in:
      pkg: nodejs
{%- else %}
npm:
{%- if grains['os'] == 'Debian' and grains['osrelease']|float < 8 %}
  file.exists:
    - name: {{ npm_bin }}
    - require:
      - file: install-npm
{% include 'node/source_npm.sls' %}
{%- else %}
  pkg.installed:
    - name: {{ node.npm_pkg }}
    - require:
      - pkg: nodejs
{%- endif %}
{%- endif %}
nodejs:
  pkg.installed:
    - name: {{ node.node_pkg }}
