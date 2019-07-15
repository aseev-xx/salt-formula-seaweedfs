{% from 'seaweedfs/common/lib.sls' import weed_instance_template with context %}
{% set instance = 's3' %}
{{ weed_instance_template(instance) }}
