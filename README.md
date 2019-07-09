## Salt template for SeaweedFs

### How it works:

Consist of:

 * seaweedfs.master
 * seaweedfs.volume
 * seaweedfs.filer


### Pillar
 In pillar created base state seaweedfs/common/init.sls
 
#### init.sls
  
```
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
      mdir: "/dir/master"
      defaultReplication: XXX
      volumeSizeLimitMB: XXXXX
      ...
    volume:
      # params
    filer:
      # params
```

In pillar top.sls:

```
'^cluster_node_\d+\.g$':
  - match: pcre
  - seaweedfs.common
```

### State

In salt top.sls add needed roles on group of hosts:

```
'^cluster_node_\d+\.g$':
  - match: pcre
  - seaweedfs.master
  - seaweedfs.volume
  - seaweedfs.filer
```

### Metrics

to be continue...

### Monitoring

to be continue...