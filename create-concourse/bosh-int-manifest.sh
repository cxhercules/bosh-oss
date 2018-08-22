#!/bin/bash

cd $(dirname $0)

## Checkout the particular concourse version, in this particular case a branch that has what I need
if [ ! -d concourse-bosh-deployment ]; then
   git clone -b pr-uaa-credhub https://github.com/cxhercules/concourse-bosh-deployment.git
else
   pushd concourse-bosh-deployment
      ## getting any new changes I may have added to branch, and checking out the branch just in case
      git pull
      git checkout pr-uaa-credhub
   popd
fi


#Deploy concourse to BOSH OSS
bosh -n int -d concourse concourse-bosh-deployment/cluster/concourse.yml \
  -o concourse-bosh-deployment/cluster/operations/static-web.yml \
  -o concourse-bosh-deployment/cluster/operations/tls-vars.yml \
  -o concourse-bosh-deployment/cluster/operations/tls.yml \
  -o concourse-bosh-deployment/cluster/operations/basic-auth.yml \
  -o concourse-bosh-deployment/cluster/operations/basic-auth-vars.yml \
  -o concourse-bosh-deployment/cluster/operations/privileged-https.yml \
  -o concourse-bosh-deployment/cluster/operations/scale.yml \
  -o concourse-bosh-deployment/cluster/operations/postgres-link.yml \
  -o concourse-bosh-deployment/cluster/operations/credhub-colocated.yml \
  -o concourse-bosh-deployment/cluster/operations/uaa.yml \
  -o concourse-bosh-deployment/cluster/operations/azs.yml \
  -o concourse-bosh-deployment/cluster/operations/update-add-time.yml \
  -l concourse-bosh-deployment/versions.yml \
  -l vars.yml
