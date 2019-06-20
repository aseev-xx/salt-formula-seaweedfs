## Salt template for SeaweedFs

### Как с ним работать:
на каждую групппу хостов необходимо навесить нужную роль

 * seaweedfs.master
 * seaweedfs.volume
 * seaweedfs.filer


### Pillar
 В репозитории с пилларами создана общая директория seaweedfs/{cluster_1,cluster_2,..}
 
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
После того как пиллар создан его нужно навесить в top.sls для пилларов.

### State

В top.sls для стейтов добавляем для хостов нужные роли

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