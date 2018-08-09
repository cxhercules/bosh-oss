# CREATE BOSS OSS in vSphere

bosh delete-env bosh-deployment/bosh.yml \
    --state=state.json \
    --vars-store=creds.yml \
    -o bosh-deployment/vsphere/cpi.yml \
    -o bosh-deployment/vsphere/resource-pool.yml \
    -o bosh-deployment/jumpbox-user.yml \
    -o bosh-deployment/misc/ntp.yml \
    -o bosh-deployment/uaa.yml \
    -o bosh-deployment/credhub.yml \
    -o bosh-deployment/misc/dns.yml \
    -l vars.yml
