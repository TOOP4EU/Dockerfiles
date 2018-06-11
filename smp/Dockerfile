FROM ubuntu

#apt-get parts
RUN apt-get update  && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y unzip && \
    apt-get clean && \
    apt-get autoremove

ARG SMP_VERSION=5.0.6

ARG TOMCAT_URL=http://ftp.itu.edu.tr/Mirror/Apache/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
ARG SMP_URL=http://repo2.maven.org/maven2/com/helger/peppol-smp-server-webapp-xml/${SMP_VERSION}/peppol-smp-server-webapp-xml-${SMP_VERSION}.war

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
    TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.31 \
    TOMCAT_URL=$TOMCAT_URL \
    SMP_URL=$SMP_URL \
    JAVA_OPTS="-Dsmp.webapp.properties.path=/toop-dir/smp/config/webapp.properties -Dsmp.server.properties.path=/toop-dir/smp/config/smp-server.properties -Dpd.client.properties.path=/toop-dir/smp/config/pd-client.properties"

EXPOSE $TC_PORT


WORKDIR /


#COPY SCRIPTS TO THE ROOT
COPY tomcat-setup.sh smp-setup.sh prepare-and-run.sh default-* /

#run tomcat script
RUN chmod +x tomcat-setup.sh && ./tomcat-setup.sh

#run smp setup
RUN chmod +x smp-setup.sh && ./smp-setup.sh

RUN rm -fr smp-setup.sh tomcat-setup.sh

RUN chmod +x ./prepare-and-run.sh  

CMD ["./prepare-and-run.sh"]
