{% set app = 'master' %}

include:
  - seaweedfs.common

{{ app }}-sysconfig:
  file:
    - managed
    - name: /etc/sysconfig/weed-{{ app }}
    - source: salt://{{ tpldir }}/templates/weed-{{ app }}.sysconfig.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

{{ app }}-service:
  service:
    - running
    - name: weed@{{ app }}
    - enable: True
    - watch:
      - file: {{ app }}-sysconfig
    - require:
      - file: {{ app }}-sysconfig