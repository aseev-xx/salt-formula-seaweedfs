seaweedfs:
  config:
    version: "1.35"
    hash: "51ae8e0eaed7688a1432b1fc7654e734"
    topology:
      cluster_node_1:
        dc: "dc1"
        rack: "rack1"
      cluster_node_2:
        dc: "dc2"
        rack: "rack1"
      cluster_node_3:
        dc: "dc3"
        rack: "rack1"
    master:
      port: "9333"
      mdir: "/mnt/master"
      volumeSizeLimitMB: "10240"
      defaultReplication: "100"
      pulseSeconds: "1"