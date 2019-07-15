{%- from 'seaweedfs/map.jinja' import config with context %}

{% set hostname = salt['grains.get']('fqdn') -%}

{# prepare cluster string <ip><port>,<ip>:<port>,...#}
{% set cluster_nodes = [] -%}
{% for node in config.topology -%}
{% do cluster_nodes.append( node + ":" + config.master.port ) -%}
{% endfor -%}

{% set cluster = cluster_nodes | join(',') %}

{# prepare filer string for s3 <ip><port> - only one host:prot acceptible #}
{% set cluster_filer = hostname + ":" + config.filer.port %}

{# prepare master params string #}
{% set master_params = [] -%}
{% for name, value in config.master.items() -%}
{% do master_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{% set s_master_params = master_params | join(' ') %}

{# prepare volume params string #}
{% set volume_params = [] -%}
{% for name, value in config.volume.items() -%}
{% do volume_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{% set s_volume_params = volume_params | join(' ') %}

{# prepare topology volume params string #}
{% set volume_location = [] -%}
{% set node_specific = salt['pillar.get']('seaweedfs:config:topology:'+ hostname) -%}
{% for name, value in node_specific.items() -%}
{% do volume_location.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{% set s_volume_location = volume_location | join(' ') %}

{# prepare filer params string #}
{% set filer_params = [] -%}
{% for name, value in config.filer.items() -%}
{% do filer_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{% set s_filer_params = filer_params | join(' ') %}

{# prepare s3 params string #}
{% set s3_params = [] -%}
{% for name, value in config.s3.items() -%}
{% do s3_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{% set s_s3_params = s3_params | join(' ') %}

{%- set weed = {} %}

{%- do weed.update({
  'hostname': hostname,
  'cluster': cluster,
  'cluster_filer': cluster_filer,
  's_master_params': s_master_params,
  's_volume_params': s_volume_params,
  's_volume_location': s_volume_location,
  's_filer_params': s_filer_params,
  's_s3_params': s_s3_params
  }) %}
