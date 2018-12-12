#!/bin/bash

yum update -y
yum install -y gcc git openssl-devel readline-devel zlib-devel sqlite-devel \
    java-1.8.0-openjdk gcc-c++ curl

firewall-cmd --zone=public --add-port=3000/tcp --permanent
firewall-cmd --zone=public --add-port=8983/tcp --permanent
firewall-cmd --reload
