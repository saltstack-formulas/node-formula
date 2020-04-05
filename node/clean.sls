# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family not in ('FreeBSD', 'Windows', 'MacOS',) %}

include:
  - .config.clean
  - .package.clean
  - .source.clean
  - .binary.clean

    {%- else %}

node-not-available-to-clean:
  test.show_notification:
    - text: |
        The node package is unavailable on {{ salt['grains.get']('osfinger', grains.os_family) }}

    {%- endif %}