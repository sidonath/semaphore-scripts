#!/bin/bash
# Description : install oracle java 11 on sempahore platform
# Runs: on semaphore 1 platform
# Usage: wget https://raw.githubusercontent.com/renderedtext/semaphore-scripts/nbors-semaphore1/java11install.sh | bash


#downloading from Oracle
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz
tar -zxvf jdk-*
#move into place
sudo mv jdk-11.0.1 /usr/lib/jvm/java-11-oracle
#install
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-11-oracle/bin/java  1111
#select default
version_info=$(echo -e '\n' | update-alternatives --config java | grep 1111.*manual | sed 's/*//')
option_number=$(echo $version_info | awk '{print $1}')
java_home_path=$(echo $version_info | awk '{print $2}' | grep -oP '/usr/lib/jvm/java[^/]*')

echo $option_number | sudo update-alternatives --config java > /dev/null 2>&1
echo $option_number | sudo update-alternatives --config javac > /dev/null 2>&1

export JAVA_HOME="$java_home_path"

#verify java version
java -version

