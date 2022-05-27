#!/bin/bash

cd /root/ComplianceX
git checkout dev
git pull
$(aws ecr get-login --region us-east-1 --no-include-email)
#docker login -u AWS -p $(aws ecr get-login --region us-east-1 --no-include-email) https://059516066038.dkr.ecr.us-east-1.amazonaws.com
docker build . -t 059516066038.dkr.ecr.us-east-1.amazonaws.com/compliancex:latest
docker push 059516066038.dkr.ecr.us-east-1.amazonaws.com/compliancex:latest
cd /home/ubuntu/complianceX
helm upgrade compliancex . --recreate-pods
