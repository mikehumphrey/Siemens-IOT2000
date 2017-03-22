# Installing Mosquitto
#Now we are ready to install Mosquitto, use the following commands, if you have an issue with the wget not finding the file, it may be possible a later version has been released, check repository and update your script to compensate. Again this process can take a while but it will get there. 

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


Setting Node-Red and Mosquitto to auto start on power up or reboot. Node-red, make a file and paste in the following text. File Path: 
 /etc/init.d/autostart_node_red.sh> 
#! /bin/sh
# for example:
/usr/bin/node-red -u /home/root/.node-red -v &
exit 0


Mosquitto make a file and paste in the following text. File Path:
/etc/init.d/autostart_mosquitto.sh > 
#! /bin/sh
# for example:
/usr/bin/mosquitto &
exit 0


Now add permissions and set the auto start demon to work: 
chmod +x /etc/init.d/autostart_node_red.sh
update-rc.d autostart_node_red.sh defaults
chmod +x /etc/init.d//autostart_mosquitto.sh
update-rc.d autostart_mosquitto.sh defaults


Run the following for adding a repository for MRAA:
echo "src mraa-upm http://iotdk.intel.com/repos/3.5/intelgalactic/opkg/i586" > /etc/opkg/mraa-upm.conf>


Now we have everything installed we can reboot and see if everything works.
