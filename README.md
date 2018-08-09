**Objective**

* Install BOSS OSS
* Deploy Concourse Cluster

**IaaS**

* GCP
* vSphere (next)

**Working with GCP**

* [Configure Jumpbox](https://github.com/amlan-pivotal/bosh-oss/issues/3)
* [Setup BOSH OSS](https://github.com/amlan-pivotal/bosh-oss/issues/2)
* [Install Concourse on BOSH OSS](https://github.com/amlan-pivotal/bosh-oss/issues/4)

**Docker**

Docker with all install tools can be spun up with volume so you can maintain state.json and other files you would be interested int. 

```
docker run -v $(pwd):/root/bosh -it cxhercules/bosh-cli-env bash
```

* Where pwd is your bosh-oss git repo root directory.  
