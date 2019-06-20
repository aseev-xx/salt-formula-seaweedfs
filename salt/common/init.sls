weed-archive:
  archive.extracted:
    - name: /usr/local/sbin/
    - source: https://github.com/chrislusf/seaweedfs/releases/download/1.35/linux_amd64_large_disk.tar.gz
    - source_hash: md5=51ae8e0eaed7688a1432b1fc7654e734
    - keep: True
    - user: root
    - group: root
    - options: z
    - archive_format: tar
    - enforce_toplevel: False
    - source_hash_updateFalse: True

/etc/seaweedfs:
  file.directory:
    - makedirs: True
    - require:
      - archive: weed-archive

/var/log/seaweedfs:
  file.directory:
    - makedirs: True
    - require:
      - archive: weed-archive

weed-systemd-unit:
  file.managed:
    - name: /etc/systemd/system/weed@.service
    - source: salt://{{ tpldir }}/files/weed@.service
    - require:
      - archive: weed-archive

weed-systemd-reload-cmd:
  cmd.wait:
    - name: systemctl daemon-reload
    - watch:
      - file: weed-systemd-unit