#!/bin/bash
# change the current working directory to where yum repos configuration files is there
cd /etc/yum.repos.d

#create a file with the name "fluent-bit.repo"
touch fluent-bit.repo

#assign the string value "fluent-bit.repo" to the variable file_name
file_name="fluent-bit.repo"

#the variable content is assigned a multi-line string that represents the configuration content for the fluent-bit.repo file
content="[fluent-bit]
name = Fluent Bit
baseurl = https://packages.fluentbit.io/amazonlinux/2/
gpgcheck=1
gpgkey=https://packages.fluentbit.io/fluentbit.key
enabled=1"

#write the value of the content variable into the file_name(fluent-bit.repo)
echo "$content" > "$file_name"

#then install fluent-bit using yum command
yum install -y fluent-bit

#start fluent-bit
systemctl start fluent-bit

#enable at the bootstrap
systemctl enable fluent-bit