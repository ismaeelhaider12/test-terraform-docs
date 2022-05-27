#!/bin/bash

cd /root/ComplianceX-TicketingSystem
git checkout dev
git pull
$(aws ecr get-login --region us-east-1 --no-include-email)
docker build . -t 059516066038.dkr.ecr.us-east-1.amazonaws.com/ticketingsystem:latest
docker push 059516066038.dkr.ecr.us-east-1.amazonaws.com/ticketingsystem:latest
cd /home/ubuntu/ticketingsystem
helm upgrade ticketingsystem . --recreate-pods