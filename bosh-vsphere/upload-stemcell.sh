#!/bin/bash

# Ubuntu trusty
bosh_cmd=$(curl -s https://bosh.cloudfoundry.org/stemcells/bosh-vsphere-esxi-ubuntu-trusty-go_agent|grep -A2 "bosh upload-stemcell"|sed -e 's/<div.*<pre>//g' -e 's/<a.*">//g' -e 's/<\/a>.*$//g' -e 's/\\//g' |tr -d '\n')

# Ubuntu Xenial
bosh_cmd=$(curl -s https://bosh.io/stemcells/bosh-vsphere-esxi-ubuntu-xenial-go_agent|grep -A2 "bosh upload-stemcell"|sed -e 's/<div.*<pre>//g' -e 's/<a.*">//g' -e 's/<\/a>.*$//g' -e 's/\\//g' |tr -d '\n')

eval $bosh_cmd
