#!/bin/bash

cd /root/compliancex-workers
git checkout dev
git pull
$(aws ecr get-login --region us-east-1 --no-include-email)
#docker login -u AWS -p $(aws ecr get-login --region us-east-1 --no-include-email) https://059516066038.dkr.ecr.us-east-1.amazonaws.com
cd /root/compliancex-workers/LoggingWorker
docker build . -t 059516066038.dkr.ecr.us-east-1.amazonaws.com/logging-worker:latest
docker push 059516066038.dkr.ecr.us-east-1.amazonaws.com/logging-worker:latest
cd /home/ubuntu/loggingWorker
helm upgrade loggingworker . --recreate-pods

