FROM toop/tomcat-jdk-image:1


ARG SMP_VERSION=5.0.8
ARG SMP_URL=http://repo2.maven.org/maven2/com/helger/peppol-smp-server-webapp-xml/${SMP_VERSION}/peppol-smp-server-webapp-xml-${SMP_VERSION}.war

ENV CATALINA_HOME /tomcat
#this is linked from the shared java container
#run the image with a -v shared_jre_volume:/jre_home
ENV SMP_VERSION=$SMP_VERSION \
    SMP_URL=$SMP_URL \
    JAVA_OPTS="-Dsmp.webapp.properties.path=/toop-dir/smp/config/webapp.properties -Dsmp.server.properties.path=/toop-dir/smp/config/smp-server.properties -Dpd.client.properties.path=/toop-dir/smp/config/pd-client.properties"

WORKDIR /


COPY prepare-and-run.sh default-* /

RUN echo "Downloading phoss SMP from $SMP_URL" && \
    wget $SMP_URL -O smp.zip  && \
    unzip smp.zip -d /smpsetup/  && \
    rm -fr $CATALINA_HOME/webapps && \
    mkdir -p $CATALINA_HOME/webapps && \
    cp -r /smpsetup/ $CATALINA_HOME/webapps/ROOT && \
    rm -fr smpsetup smp.zip && \
    chmod  +x  ./prepare-and-run.sh  

CMD ["./prepare-and-run.sh"]
