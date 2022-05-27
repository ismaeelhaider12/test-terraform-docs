#!/bin/bash

sudo sysctl -p /etc/sysctl.conf

yum install redhat-lsb-core -y
/bin/sleep 5

echo "install hfs /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install hfsplus /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install squashfs /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install udf /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install dccp /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install sctp /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install rds /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install tipc /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install usb-storage /bin/true" >> /etc/modprobe.d/blacklist.conf
echo "install cramfs /bin/true" >> /etc/modprobe.d/blacklist.conf


sudo chown -R libstoragemgmt:libstoragemgmt /var/run/lsm

chmod -R g-s /usr/bin/write
chmod -R g-s /usr/bin/locate
chmod -R g-s /usr/libexec/openssh/ssh-keysign
chmod -R g-s /usr/libexec/utempter/utempter
chmod -R g-s /usr/sbin/netreport
chmod -R u-s /usr/bin/chage
chmod -R u-s /usr/bin/crontab
chmod -R u-s /usr/bin/staprun
chmod -R u-s /usr/libexec/dbus-1/dbus-daemon-launch-helper
chmod -R u-s /usr/sbin/mount.nfs
chmod -R u-s /usr/sbin/pam_timestamp_check
chmod -R u-s /usr/sbin/unix_chkpwd
chmod -R u-s /usr/sbin/userhelper
chmod -R u-s /usr/sbin/usernetctl

chmod -R u-s /home/ec2-user/install.sh
chmod -R u-s /home/ec2-user/boot.sh
chmod -R u-s /home/ec2-user/script.sh
chmod -R g-s /home/ec2-user/install.sh
chmod -R g-s /home/ec2-user/boot.sh
chmod -R g-s /home/ec2-user/script.sh

groupadd shadow


touch /etc/pam.d/common-password
echo "password    [success=1 default=ignore]  pam_unix.so minlen=1 sha512" >> /etc/pam.d/common-password

cat /dev/null > /etc/issue.net
cat /dev/null > /etc/issue



chmod 600 /etc/group-
mount -o remount,noexec /dev/shm
chown -R root:shadow /etc/shadow
chown -R root:shadow /etc/shadow-
chown -R root:shadow /etc/gshadow
chmod 600 /etc/passwd-
chmod 600 /etc/shadow-
chmod 600 /etc/group-

echo "auth            required        pam_wheel.so use_uid" >> /etc/pam.d/su
echo -en "\nGRUB_CMDLINE_LINUX=.*audit=1" >> /etc/default/grub

sed -i 's/'99999'/'90'/' /etc/login.defs
sed -i "26d" /etc/login.defs
sed -i '26 i PASS_MIN_DAYS   7' /etc/login.defs

echo -en "\nGRUB_CMDLINE_LINUX=.*audit_backlog_limit=8192" >> /etc/default/grub

chmod 600 /var/log/amazon/ssm/hibernate.log

#sed -i 's/'root'/'ec2-user'/' /etc/sudoers.d/90-cloud-init-users
sed -i 's/'ec2-user'/'root'/' /etc/sudoers.d/90-cloud-init-users

yum install ntp -y
/bin/sleep 5

sed -i "2d" /etc/sysconfig/chronyd
echo "OPTIONS="-u chrony" " >> /etc/sysconfig/chronyd

sed -i "12 i minlen=14" /etc/security/pwquality.conf
sed -i "17 i dcredit=-1" /etc/security/pwquality.conf
sed -i "24 i ucredit=-1" /etc/security/pwquality.conf
sed -i "30 i lcredit=-1" /etc/security/pwquality.conf
sed -i "36 i ocredit=-1" /etc/security/pwquality.conf

echo "Protocol 2" >> /etc/ssh/sshd_config
echo "LogLevel INFO" >> /etc/ssh/sshd_config
sed -i 's/X11Forwarding\syes/X11Forwarding  no/' /etc/ssh/sshd_config
sed -i 's/MaxAuthTries\s6/MaxAuthTries  4/' /etc/ssh/sshd_config
sed -i 's/'#MaxAuthTries'/'MaxAuthTries'/' /etc/ssh/sshd_config
sed -i 's/'#UsePrivilegeSeparation'/'UsePrivilegeSeparation'/' /etc/ssh/sshd_config
sed -i 's/'#IgnoreRhosts'/'IgnoreRhosts'/' /etc/ssh/sshd_config
sed -i 's/'#HostbasedAuthentication'/'HostbasedAuthentication'/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin\syes/PermitRootLogin  no/' /etc/ssh/sshd_config
sed -i 's/'#PermitEmptyPasswords'/'PermitEmptyPasswords'/' /etc/ssh/sshd_config
sed -i 's/'#PermitUserEnvironment'/'PermitUserEnvironment'/' /etc/ssh/sshd_config
sed -i "27 i Ciphers aes256-ctr,aes192-ctr,aes128-ctr" /etc/ssh/sshd_config
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.coml 2" >> /etc/ssh/sshd_config
sed -i 's/#ClientAliveInterval\s0/ClientAliveInterval  300/' /etc/ssh/sshd_config
sed -i 's/#ClientAliveInterval/ClientAliveInterval/' /etc/ssh/sshd_config
sed -i 's/#ClientAliveCountMax\s3/ClientAliveCountMax  0/' /etc/ssh/sshd_config
sed -i 's/#LoginGraceTime\s2m/LoginGraceTime  60/' /etc/ssh/sshd_config
echo "Banner  /etc/issue.net/" >> /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding\syes/AllowTcpForwarding  no/' /etc/ssh/sshd_config
echo "KbdInteractiveAuthentication no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
echo "GSSAPIKeyExchange no" >> /etc/ssh/sshd_config

echo "*.* @@remote-host:514" >> /etc/rsyslog.conf


echo -en "\npam_pwquality.so" >> /etc/pam.d/common-password

touch /etc/modprobe.d/CIS.conf
echo "install vfat /bin/true" /etc/modprobe.d/CIS.conf


sed -i '7 i auth        required      pam_faillock.so preauth audit silent deny=5 unlock_time=900' /etc/pam.d/password-auth
sed -i '8 i auth        [success=1 default=bad]  pam_unix.so ' /etc/pam.d/password-auth
sed -i '9 i auth        [default=die]     pam_faillock.so authfail audit deny=5 unlock_time=900 ' /etc/pam.d/password-auth
sed -i '10 i auth        sufficient    pam_faillock.so authsucc audit deny=5 unlock_time=900 ' /etc/pam.d/password-auth
sed -i '7 i auth        required      pam_faillock.so preauth audit silent deny=5 unlock_time=900' /etc/pam.d/system-auth
sed -i '8 i auth        [success=1 default=bad]  pam_unix.so ' /etc/pam.d/system-auth
sed -i '9 i auth        [default=die]     pam_faillock.so authfail audit deny=5 unlock_time=900 ' /etc/pam.d/system-auth
sed -i '10 i auth        sufficient    pam_faillock.so authsucc audit deny=5 unlock_time=900 ' /etc/pam.d/system-auth

sed -i '17 i password    sufficient    pam_unix.so remember=5' /etc/pam.d/system-auth
sed -i '17 i password    sufficient    pam_unix.so remember=5' /etc/pam.d/password-auth
echo "password.*remember" >> /etc/pam.d/common-password

touch /etc/pam.d/common-auth
touch /etc/pam.d/common-account
echo "auth       required     pam_faillock.so" >> /etc/pam.d/common-auth
echo "pam_faillock.so" >> /etc/pam.d/common-account


chmod 600 /etc/sudoers
sed -i -e '$aDefaults  logfile="/var/log/sudo.log"' /etc/sudoers
sed -i -e '$aDefaults use_pty' /etc/sudoers

sudo amazon-linux-extras install epel -y
yum update -y
yum install tripwire -y

/bin/sleep 5

echo "AcceptEnv LANG LC" >> /etc/ssh/sshd_config
sed -i 's/#StrictModes/StrictModes/' /etc/ssh/sshd_config

echo "ALL: ALL" >>  /etc/hosts.deny

rm -rf /home/ec2-user/.ssh/authorized_keys
rm -rf /root/.ssh/authorized_keys

##########################################################
cd /dev/; dd if=/dev/zero of=tmpMnt bs=1024 count=200000
#mke2fs /dev/tmpMnt
cp -Rp /tmp /tmp_backup
mount -o loop,noexec,nosuid,rw /dev/tmpMnt /tmp
chmod 1777 /tmp
cp -Rp /tmp_backup/* /tmp/
sed -i 's/'noatime'/'noatime,nodev'/' /etc/fstab
touch /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Options=mode=1777,strictatime,noexec,nodev,nosuid" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
mount -o remount,nodev /tmp
mount -o remount,nosuid /tmp
mount -o remount,noexec /tmp
mount -o remount,nodev /dev/shm
mount -o remount,noexec /dev/shm



/bin/sleep 5

cp -r /etc/profile.d/CIS_99.1_timeout.sh /home/ec2-user/CIS_99.1_timeout.sh && rm -rf /etc/profile.d/CIS_99.1_timeout.sh

#########################################################
yum install aide -y
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
##########################################################
echo "############################################################################################################################################################"
echo "     #################################################################################################################################################"
echo "           #####################################################################################################################################"

echo "                                                                                  "
echo "We are done with the Scripts finally"
/bin/sleep 10
echo "Now hardening will start in 10 Sec to remediate rules ..!! Grab a coffee "
/bin/sleep 10

sudo hardening.sh --apply  --allow-unsupported-distribution
sudo hardening.sh --apply  --allow-unsupported-distribution