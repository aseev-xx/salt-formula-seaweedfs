{% macro weed_instance_template(instance) %}

include:
  - seaweedfs.common

{{ instance }}-sysconfig:
  file:
    - managed
    - name: /etc/sysconfig/weed-{{ instance }}
    - source: salt://{{ tpldir }}/templates/weed-{{ instance }}.sysconfig.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644

{{ instance }}-service:
  service:
    - running
    - name: weed@{{ instance }}
    - enable: True
    - watch:
      - file: {{ instance }}-sysconfig
    - require:
      - file: {{ instance }}-sysconfig

{% endmacro %}