# CREATE BOSS OSS in GCP

bosh create-env bosh-deployment/bosh.yml \
    --state=bosh-ctrl-plane/state.json \
    --vars-store=bosh-ctrl-plane/creds.yml \
    -o bosh-deployment/gcp/cpi.yml \
    -o bosh-deployment/jumpbox-user.yml \
    -o bosh-deployment/bbr.yml \
    -o bosh-deployment/misc/ntp.yml \
    -o bosh-deployment/uaa.yml \
    -o bosh-deployment/credhub.yml \
    -o bosh-deployment/misc/dns.yml \
    -v director_name=bosh-oss-director \
    -v internal_cidr=10.0.0.0/24 \
    -v internal_gw=10.0.0.1 \
    -v internal_ip=10.0.0.6 \
    --var-file gcp_credentials_json=bosh-ctrl-plane/gcp-bosh-serviceaccount.json \
    -v project_id=cso-pcfs-apj-amlan \
    -v zone=asia-south1-a \
    -v tags=[boss-oss,am-pcf-ops-manager-external] \
    -v network=am-pcf-pcf-network \
    -v subnetwork=am-pcf-management-subnet \
    -v internal_ntp=[metadata.google.internal] \
    -v internal_dns=[8.8.8.8,8.8.4.4]
