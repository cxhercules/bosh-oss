#Deploy concourse to BOSH OSS

bosh deploy -d concourse concourse-bosh-deployment/cluster/concourse.yml \
  -l concourse-bosh-deployment/versions.yml \
  -o concourse-bosh-deployment/cluster/operations/static-web.yml \
  -o concourse-bosh-deployment/cluster/operations/tls.yml \
  -o create-concourse/ops-files/tls-vars.yml \
  -o concourse-bosh-deployment/cluster/operations/basic-auth.yml \
  -o concourse-bosh-deployment/cluster/operations/privileged-https.yml \
  -o concourse-bosh-deployment/cluster/operations/scale.yml \
  --var web_ip=10.0.0.12 \
  --var external_url=https://35.200.172.165 \
  --var network_name=default \
  --var web_vm_type=default \
  --var db_vm_type=large \
  --var db_persistent_disk_type=large \
  --var worker_vm_type=large \
  --var deployment_name=concourse \
  --var web_instances=1 \
  --var worker_instances=1 \
  --var concourse_domain_name=35.200.172.165
