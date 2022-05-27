#!/bin/bash
apt install curl -y && apt  install -y lsb-release
InstanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
AccountId=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep accountId| awk '{print $3}'|sed  's/"//g'|sed 's/,//g')
echo $InstanceId
echo $AccountId
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.2.1-1_amd64.deb &&  WAZUH_MANAGER='j10eqlna5uji.cloud.wazuh.com' WAZUH_REGISTRATION_PASSWORD='URynx2iZAocglLQD3K8INq8byPxFuuje' WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent.deb
service wazuh-agent start

rm /var/ossec/etc/ossec.conf
mv /ossec.conf /var/ossec/etc/

sed -i '21 i <labels>\n   <label key="Tenant">'$AccountId'</label>\n   <label key="InstanceId">'$InstanceId'</label>\n</labels> \n' /var/ossec/etc/ossec.conf
service wazuh-agent restart

echo "background jobs running, listening for changes"

while true; do
  /var/ossec/bin/ossec-control status > /dev/null 2>&1
done
