

cd
wget http://mosquitto.org/files/source/mosquitto-1.4.10.tar.gz
tar xzf mosquitto-1.4.10.tar.gz
cd mosquitto-1.4.10
# this next step takes a while
adduser mosquitto 
make WITH_SRV=no
cd test/broker
make test
cd ../../
cp client/mosquitto_pub /usr/bin
cp client/mosquitto_sub /usr/bin
cp lib/libmosquitto.so.1 /usr/lib
cp src/mosquitto /usr/bin