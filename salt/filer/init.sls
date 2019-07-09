{% from 'seaweedfs/common/lib.sls' import weed_instance_template with context %}
{% set instance = 'filer' %}
{{ weed_instance_template(instance) }}

{# if non-default configuration prepare custom toml config #}
{{ instance }}-config:
  file:
    - managed
    - name: /etc/seaweedfs/{{ instance }}.toml
    - source: salt://{{ tpldir }}/templates/{{ instance }}.toml.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644