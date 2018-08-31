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

## Upload release
## Check if release already uploaded
bosh releases|grep kubo|grep $version
if [ $? != 0 ]; then
  bosh upload-release https://bosh.io/d/github.com/cloudfoundry-incubator/kubo-release?v=${version}
fi

## Deploy kubo to BOSH OSS
bosh -n deploy -d cfcr kubo-deployment/manifests/cfcr.yml \
  -o kubo-deployment/manifests/ops-files/misc/single-master.yml \
  -o kubo-deployment/manifests/ops-files/use-xenial-stemcell.yml \
  -o kubo-deployment/manifests/ops-files/iaas/vsphere/master-static-ip.yml \
  -o ops-files/network.yml \
  -o ops-files/vm_type.yml \
  -o ops-files/alternative_ip_in_cert.yml \
  -l vars.yml

## Apply Specs
bosh -d cfcr run-errand apply-specs

## Run Smoke Tests
bosh -d cfcr run-errand smoke-tests

## Set kubeconfig
bosh_env_name=$(bosh env --json|jq -r '.Tables[].Rows[].name')
kube_master_host=$(bosh int vars.yml --path /kubernetes_master_host)

pushd kubo-deployment
  ./bin/set_kubeconfig ${bosh_env_name}/cfcr https://${kube_master_host}:8443
popd
