#!/bin/bash

#run the smp, elonia tc and hb2b, freedonia tc and hb2b


#elonia external ports
elonia_tc_port=8081
elonia_hb2b_port=8082

#freedonia external ports
freedonia_tc_port=8083
freedonia_hb2b_port=8084

#smp external port
smp_port=9080

smp_network_name="smpnet"

#Please note that the above ports are only for external access. Since each container publishes on 8080 internally
#theese ports have no meaning for the inter-container communication. Therefore, all the configuration files
#should use port:8080


docker kill smp elonia-tc elonia-hb2b  freedonia-tc freedonia-hb2b
docker rm smp elonia-tc elonia-hb2b  freedonia-tc freedonia-hb2b

#run smp
cd smp
./run.sh ../toop-dir $smp_port



#go to connector
cd ../toop-connector-webapp
  #run elonia tc
  ./run.sh -t ../toop-dir/elonia -n elonia -c elonia-tc -p $elonia_tc_port

  #run freedonia tc
  ./run.sh -t ../toop-dir/freedonia -n freedonia -c freedonia-tc -p $freedonia_tc_port

#go to hb2b
cd ../hb2b
  #run elonia hb2b
  ./run.sh -t ../toop-dir/elonia -n elonia -c elonia-hb2b -p $elonia_hb2b_port

  #run freedonia hb2b
  ./run.sh -t ../toop-dir/freedonia -n freedonia -c freedonia-hb2b -p $freedonia_hb2b_port

cd ..

#link the containers to the smp net
docker network connect $smp_network_name elonia-tc
docker network connect $smp_network_name freedonia-tc
