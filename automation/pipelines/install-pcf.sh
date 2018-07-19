pipeline="${HOME}/bosh-oss/automation/vendor/pcf-pipelines"
opsfiles="${HOME}/bosh-oss/automation/ops-files"

fly -t concourse sp -p install-pcf \
  -c <(cat ${pipeline}/install-pcf/gcp/pipeline.yml |  \
           yaml-patch -o ${opsfiles}/pipeline-version.yml) \
  -l ${opsfiles}/prometheus-params.yml \
  -v GCP_KEY_JSON="$(cat ${HOME}/bosh-oss/gcp-bosh-serviceaccount.json)"
