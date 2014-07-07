{%- from "node/map.jinja" import npm_bin, npm_prefix with context %}
{% set pillar_get = salt['pillar.get'] -%}
{% set npm_user = pillar_get('npm:user', 'root') -%}
{% set npm_group = pillar_get('npm:group', 'root') -%}
{% set npm_version = pillar_get('npm:version', false) -%}
{% set local_tgz = '/usr/src/npm/npm-{0}.tgz'.format(npm_version) -%}
get-npm:
  file.managed:
    - name: {{ local_tgz }}
    - source: http://registry.npmjs.org/npm/-/npm-{{ npm_version }}.tgz
    - source_hash: sha1={{ pillar_get('npm:sha1sum') }}
    - user: {{ npm_user }}
    - makedirs: True
    - require:
      - pkg: nodejs
  cmd.wait:
    - cwd: /usr/src/npm
    - user: {{ npm_user }}
    - names:
      - tar xf {{ local_tgz }}
    - creates: /usr/src/npm/package
    - watch:
      - file: {{ local_tgz }}

install-npm:
  file.directory:
    - name: {{ npm_prefix }}
    - user: {{ npm_user }}
    - group: {{ npm_group }}
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
    - watch:
      - cmd: get-npm
  cmd.wait:
    - cwd: /usr/src/npm/package
    - user: {{ npm_user }}
    - env:
      - npm_config_prefix: {{ npm_prefix }}
    - names:
      - './configure --prefix={{ npm_prefix }} && node cli.js install marked && make install'
    - unless: test -f {{ npm_bin }}
    - creates: {{ npm_bin }}
    - watch:
      - file: {{ npm_prefix }}

{{ npm_bin }}:
  file.exists:
    - name: {{ npm_bin }}
    - require:
      - cmd: install-npm

{% if npm_prefix != '/usr/local' -%}
/usr/local/bin/npm:
  file.symlink:
    - target: {{ npm_bin }}
    - require:
      - cmd: install-npm
      - file: {{ npm_bin }}
{%- endif %}
