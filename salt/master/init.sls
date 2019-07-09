{% from 'seaweedfs/common/lib.sls' import weed_instance_template with context %}
{% set instance = 'master' %}
{{ weed_instance_template(instance) }}