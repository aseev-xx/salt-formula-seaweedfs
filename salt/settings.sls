{%- from 'seaweedfs/map.jinja' import config with context %}

{% set hostname = salt['grains.get']('fqdn') -%}

{# prepare cluster string <ip><port>,<ip>:<port>,...#}
{% set cluster = [] -%}
{% for node in config.topology -%}
{% do cluster.append( node + ":" + config.master.port ) -%}
{% endfor -%}

{# prepare master params string #}
{% set master_params = [] -%}
{% for name, value in config.master.items() -%}
{% do master_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{# prepare volume params string #}
{% set volume_params = [] -%}
{% for name, value in config.volume.items() -%}
{% do volume_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{# prepare topology volume params string #}
{% set volume_location = [] -%}
{% set node_specific = salt['pillar.get']('seaweedfs:config:topology:'+ hostname) -%}
{% for name, value in node_specific.items() -%}
{% do volume_location.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{# prepare filer params string #}
{% set filer_params = [] -%}
{% for name, value in config.filer.items() -%}
{% do filer_params.append( "-" + name + "=" + value ) -%}
{% endfor -%}

{%- set weed = {} %}

{%- do weed.update({
  'hostname': hostname,
  'cluster': cluster,
  'master_params': master_params,
  'volume_params': volume_params,
  'volume_location': volume_location,
  'filer_params': filer_params
  }) %}