{% from 'seaweedfs/common/lib.sls' import weed_instance_template with context %}
{% set instance = 'webdav' %}
{{ weed_instance_template(instance) }}
