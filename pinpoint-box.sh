#!/bin/bash
USER=vagrant

#로컬 타임 설정.	
	sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
        
#git 설치.
	sudo yum -y update
        sudo yum -y install git
        
#pinpoint 모듈 다운 및 설치.
	git clone https://github.com/naver/pinpoint
        sudo chown -R $USER:$USER pinpoint/
        wget https://s3-ap-northeast-1.amazonaws.com/devarchi33-pinpoint/JavaSet.tar
	mv JavaSet.* JavaSet.tar
        sudo chown $USER:$USER JavaSet.tar
        tar -xvf JavaSet.tar
        rm -rf JavaSet.tar
        mkdir scripts
        sudo chown -R $USER:$USER scripts/
        mv *.sh ./scripts
        sudo JavaSet/jdk-6u45-linux-x64-rpm.bin
        sudo mv /usr/java/jdk1.6.0_45 /usr/local
        sudo ln -s /usr/local/jdk1.6.0_45 /usr/local/java6
        sudo tar -xvf JavaSet/jdk-7u79-linux-x64.gz -C /usr/local
        sudo ln -s /usr/local/jdk1.7.0_79 /usr/local/java7
        sudo tar -xvf JavaSet/jdk-8u65-linux-x64.gz -C /usr/local
        sudo ln -s /usr/local/jdk1.8.0_65 /usr/local/java8
        sudo tar -xvf JavaSet/apache-maven-3.3.9-bin.tar.gz -C /usr/local
        sudo ln -s /usr/local/apache-maven-3.3.9 /usr/local/maven3.3
        sudo ln -s /home/$USER/pinpoint/quickstart /usr/local/pinpoint_quick
        sudo ln -s /home/$USER/pinpoint/quickstart/hbase/hbase-1.0.1 /usr/local/hbase
        rm -rf *.rpm
	systemctl stop firewalld

#환경변수 설정.
	sudo cp /vagrant/profile /etc/profile
	source /etc/profile

#hbase 설치.
	#/bin/su - vagrant -c /home/vagrant/pinpoint/quickstart/bin/start-hbase.sh
