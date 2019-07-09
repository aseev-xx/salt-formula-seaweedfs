seaweedfs:
  config:
    version: "1.35"
    hash: "51ae8e0eaed7688a1432b1fc7654e734"
    topology:
      cluster_node_1:
        dataCenter: "dc1"
        rack: "rack1"
        max: "7,7,7,7"
        dir: "/mnt/data/volume1,/mnt/data/volume2,/mnt/data/volume3,/mnt/data/volume4"
      cluster_node_2:
        dataCenter: "dc2"
        rack: "rack1"
        max: "7,7,7,7"
        dir: "/mnt/data/volume1,/mnt/data/volume2,/mnt/data/volume3,/mnt/data/volume4"
      cluster_node_3:
        dataCenter: "dc3"
        rack: "rack1"
        max: "7,7,7,7"
        dir: "/mnt/data/volume1,/mnt/data/volume2,/mnt/data/volume3,/mnt/data/volume4"
    master:
      port: "9333"
      mdir: "/mnt/master"
      volumeSizeLimitMB: "10240"
      defaultReplication: "100"
      pulseSeconds: "1"
    volume:
      port: "8081"
      compactionMBps: "60"
    filer:
      port: "8888"
      defaultReplicaPlacement: "100"