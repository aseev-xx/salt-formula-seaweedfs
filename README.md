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
```

In top.sls:

```
'^cluster_node_\d+\.g$':
  - match: pcre
  - seaweedfs.common
```

### State

In top.sls add needed roles on group of hosts:

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