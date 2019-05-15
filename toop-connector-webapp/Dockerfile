FROM tomcat:9-jre11

ARG TOOP_CONNECTOR_VERSION
ARG TC_WAR_URL=http://central.maven.org/maven2/eu/toop/toop-connector-webapp/${TOOP_CONNECTOR_VERSION}/toop-connector-webapp-${TOOP_CONNECTOR_VERSION}.war
ARG TC_WAR_NAME=toop-connector-webapp-${TOOP_CONNECTOR_VERSION}.war


#COPY SCRIPTS and the default config TO THE ROOT
RUN  mkdir /supplementaryFiles

COPY default-toop-connector.properties playground-keystore.jks /supplementaryFiles/
COPY prepare-and-run.sh /

#create tc webapp folder
WORKDIR $CATALINA_HOME/webapps

ENV TC_PORT=$TC_PORT \
    TC_WAR_URL=$TC_WAR_URL \
    TC_WAR_NAME=$TC_WAR_NAME \
    TOOP_CONNECTOR_VERSION=${TOOP_CONNECTOR_VERSION} \
    JAVA_OPTS="-Dtoop.connector.server.properties.path=/toop-dir/tc/config/toop-connector.properties" \
    CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -Djava.security.egd=file:/dev/urandom"

RUN rm -fr manager host-manager ROOT && \
    echo "Downloading connector from $TC_WAR_URL" && \
    wget $TC_WAR_URL && \
    unzip $TC_WAR_NAME -d ROOT  && \
    rm -fr $TC_WAR_NAME  && \
    chmod +x /prepare-and-run.sh 

WORKDIR /
#run connector setup
CMD ["/prepare-and-run.sh"]
