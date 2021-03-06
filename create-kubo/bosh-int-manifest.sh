#!/bin/bash

cd $(dirname $0)
version="0.20.0"

## Checkout the particular kubo version, in this particular case a branch that has what I need
if [ ! -d kubo-deployment ]; then
   git clone -b v${version} https://github.com/cloudfoundry-incubator/kubo-deployment.git
else
   pushd kubo-deployment
      ## getting any new changes I may have added to branch, and checking out the branch just in case
      git checkout v${version}
   popd
fi


#Deploy kubo to BOSH OSS
bosh int -d cfcr kubo-deployment/manifests/cfcr.yml \
  -o kubo-deployment/manifests/ops-files/misc/single-master.yml \
  -o kubo-deployment/manifests/ops-files/use-xenial-stemcell.yml \
  -o kubo-deployment/manifests/ops-files/iaas/vsphere/master-static-ip.yml \
  -o ops-files/network.yml \
  -o ops-files/vm_type.yml \
  -o ops-files/alternative_ip_in_cert.yml \
  -l vars.yml
