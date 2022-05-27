#!/bin/bash

cd /root/ComplianceX-Compliance
git checkout dev
git pull
$(aws ecr get-login --region us-east-1 --no-include-email)
#docker login -u AWS -p $(aws ecr get-login --region us-east-1 --no-include-email) https://059516066038.dkr.ecr.us-east-1.amazonaws.com
docker build . -t 059516066038.dkr.ecr.us-east-1.amazonaws.com/scantool:latest
docker push 059516066038.dkr.ecr.us-east-1.amazonaws.com/scantool:latest
cd /home/ubuntu/scantool
helm upgrade scantool . --recreate-pods
