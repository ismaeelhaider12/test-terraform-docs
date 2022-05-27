sudo rm -rf /home/ec2-user/.ssh/authorized_keys
sudo rm -rf /root/.ssh/authorized_keys
sudo sed -i 's/'ec2-user'/'root'/' /etc/sudoers.d/90-cloud-init-users
sudo mount -o remount,noexec /dev/shm
sudo chown -R libstoragemgmt:libstoragemgmt /var/run/lsm
chown -R libstoragemgmt:libstoragemgmt /var/run/lsm
sudo mount -o remount,nodev /tmp
sudo mount -o remount,nosuid /tmp
sudo mount -o remount,noexec /tmp


sudo /home/ec2-user/tenent.sh
rm -rf /home/ec2-user/tenent.sh

sudo chown ossec /var/ossec
sudo rm -rf /etc/profile.d/CIS_99.1_timeout.sh
echo "TMOUT=600" >> /etc/profile


sudo hardening.sh --apply  --allow-unsupported-distribution
sudo hardening.sh --apply  --allow-unsupported-distribution