crontab -r
crontab -l | { cat; echo "#!/bin/bash"; } | crontab -
crontab -l | { cat; echo "@reboot sudo /home/ec2-user/boot.sh"; } | crontab -
crontab -l | { cat; echo "@reboot /bin/boot.sh"; } | crontab -
crontab -l | { cat; echo "@reboot /home/boot.sh"; } | crontab -

yum install git -y
git init
git clone https://github.com/ovh/debian-cis.git
cd debian-cis && cp debian/default /etc/default/cis-hardening
sed -i "s#CIS_ROOT_DIR=.*#CIS_ROOT_DIR='$(pwd)'#" /etc/default/cis-hardening
bin/hardening/1.1.1.1_disable_freevxfs.sh --audit-all
cp -r /home/ec2-user/debian-cis/bin/hardening.sh /bin
hardening.sh --apply  --allow-unsupported-distribution
cd /home/ec2-user/debian-cis/etc/conf.d/
sed -i 's/'audit'/'enabled'/' ./*
#sed -i 's/'enabled'/'audit'/' 99.*
cd /home/ec2-user/
hardening.sh --apply  --allow-unsupported-distribution
