#!/bin/bash

cd /root/ComplianceX-Infra-Provisioning-AWS
git checkout dev
git pull
$(aws ecr get-login --region us-east-1 --no-include-email)
#docker login -u AWS -p $(aws ecr get-login --region us-east-1 --no-include-email) https://059516066038.dkr.ecr.us-east-1.amazonaws.com
docker build . -t 059516066038.dkr.ecr.us-east-1.amazonaws.com/provisioningtool:latest
docker push 059516066038.dkr.ecr.us-east-1.amazonaws.com/provisioningtool:latest
cd /home/ubuntu/provisioningTool
helm upgrade provisioningtool . --recreate-pods
