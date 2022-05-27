#!/bin/bash 
InstanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
AccountId=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep accountId| awk '{print $3}'|sed  's/"//g'|sed 's/,//g')
rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH
cat > /etc/yum.repos.d/wazuh.repo << EOF
[wazuh]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=EL-$releasever - Wazuh
baseurl=https://packages.wazuh.com/4.x/yum/
protect=1
EOF
WAZUH_MANAGER="54.87.122.19" yum install wazuh-agent -y 
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
sed -i '21 i <labels>\n   <label key="Tenant">'$AccountId'</label>\n   <label key="InstanceId">'$InstanceId'</label>\n</labels> \n' /var/ossec/etc/ossec.conf
systemctl restart wazuh-agent