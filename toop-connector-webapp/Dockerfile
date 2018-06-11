FROM ubuntu


ARG TOOP_CONNECTOR_VERSION=0.9.1

#apt-get parts
RUN apt-get update  && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y unzip && \
    apt-get install -y curl && \
    apt-get clean && \
    apt-get autoremove

ARG TOMCAT_URL=http://ftp.itu.edu.tr/Mirror/Apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
ARG TC_WAR_URL=http://repo2.maven.apache.org/maven2/eu/toop/toop-connector-webapp/${TOOP_CONNECTOR_VERSION}/toop-connector-webapp-${TOOP_CONNECTOR_VERSION}.war

ARG TC_PORT=8080
ARG JAVA_HOME=/jdk_home

ENV CATALINA_HOME /tomcat
#this is linked from the shared java container
#run the image with a -v shared_jre_volume:/jre_home
ENV JAVA_HOME="$JAVA_HOME" \
    JRE_HOME="$JAVA_HOME" \
    JDK_HOME="$JAVA_HOME" \
    PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH \
    SMP_VERSION=$SMP_VERSION \
    TC_PORT=$TC_PORT \
    TC_WAR_URL=$TC_WAR_URL \
    TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.31 \
    TC_WAR_URL=$TC_WAR_URL \
    TOMCAT_URL=$TOMCAT_URL \
    SMP_URL=$SMP_URL \
    TOOP_CONNECTOR_VERSION=${TOOP_CONNECTOR_VERSION} \
    JAVA_OPTS="-Dtoop.connector.server.properties.path=/toop-dir/tc/config/toop-connector.properties"

EXPOSE $TC_PORT

WORKDIR /

#COPY SCRIPTS and the default config TO THE ROOT
COPY tomcat-setup.sh connector-setup.sh prepare-and-run.sh default-toop-connector.properties /

#run tomcat script
RUN chmod +x tomcat-setup.sh && ./tomcat-setup.sh

#run connector setup
RUN chmod +x connector-setup.sh && ./connector-setup.sh

RUN rm -fr tomcat-setup.sh connector-setup.sh

RUN chmod +x ./prepare-and-run.sh  

CMD ["./prepare-and-run.sh"]
