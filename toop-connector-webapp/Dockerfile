FROM toop/tomcat-jdk-image:1

ARG TOOP_CONNECTOR_VERSION=0.9.1
ARG TC_WAR_URL=http://repo2.maven.apache.org/maven2/eu/toop/toop-connector-webapp/${TOOP_CONNECTOR_VERSION}/toop-connector-webapp-${TOOP_CONNECTOR_VERSION}.war
ARG TC_WAR_NAME=toop-connector-webapp-${TOOP_CONNECTOR_VERSION}.war


#COPY SCRIPTS and the default config TO THE ROOT
COPY prepare-and-run.sh default-toop-connector.properties /

#create tc webapp folder
WORKDIR $CATALINA_HOME/webapps

RUN rm -fr manager host-manager ROOT && \
    echo "Downloading connector from $TC_WAR_URL" && \
    wget $TC_WAR_URL && \
    unzip $TC_WAR_NAME -d ROOT  && \
    rm -fr $TC_WAR_NAME  && \
    chmod +x /prepare-and-run.sh 


ADD toop-connector-webapp-0.9.2-SNAPSHOT.war .

RUN rm -fr ROOT && \
    unzip toop-connector-webapp-0.9.2-SNAPSHOT.war -d ROOT && \
    rm -fr toop-connector-webapp-0.9.2-SNAPSHOT.war


ENV TC_PORT=$TC_PORT \
    TC_WAR_URL=$TC_WAR_URL \
    TC_WAR_NAME=$TC_WAR_NAME \
    TOOP_CONNECTOR_VERSION=${TOOP_CONNECTOR_VERSION} \
    JAVA_OPTS="-Dtoop.connector.server.properties.path=/toop-dir/tc/config/toop-connector.properties"


WORKDIR /
#run connector setup
CMD ["/prepare-and-run.sh"]
