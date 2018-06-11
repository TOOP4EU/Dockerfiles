echo "TC PORT: $TC_PORT"
echo "Connector URL $TC_WAR_URL"


cd $CATALINA_HOME/webapps     
#create tc webapp folder
mkdir tc

echo "Downloading connector from $TC_WAR_URL"
wget $TC_WAR_URL

#grab the name of the connector and unzip it to the TC folder
tc_war_name=`find . -name 'toop-connector-webapp*war'`
if [ "$tc_war_name" = "" ]
then
   echo "Couldn't find connector war file"
   exit -1
fi
echo "Using connector $tc_war_name"
unzip $tc_war_name -d tc/

#delete the war file
rm -fr $tc_war_name

