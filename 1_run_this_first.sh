mkdir /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys

grep 'vagrant ALL=(ALL) NOPASSWD: ALL' /etc/sudoers >/dev/null || echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

cp /etc/ssh/sshd_config{,.bak}
sed 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config > /etc/ssh/sshd_config.new
mv -f /etc/ssh/sshd_config.new /etc/ssh/sshd_config

cp /etc/sudoers{,.bak}
sed -e 's/^Defaults    requiretty/#Defaults    requiretty/' -e 's/^Defaults   !visiblepw/#Defaults   !visiblepw/' /etc/sudoers > /etc/sudoers.new
mv -f /etc/sudoers.new /etc/sudoers

yum update -y

echo 'now reboot to get new kernel'
