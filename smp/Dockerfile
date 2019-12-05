FROM tomcat:9-jre11


ARG SMP_VERSION
ARG SMP_URL=http://repo2.maven.org/maven2/com/helger/phoss-smp-webapp-xml/${SMP_VERSION}/phoss-smp-webapp-xml-${SMP_VERSION}.war

#this is linked from the shared java container
#run the image with a -v shared_jre_volume:/jre_home
ENV SMP_VERSION=$SMP_VERSION \
    SMP_URL=$SMP_URL \
    JAVA_OPTS="$JAVA_OPTS -Dsmp.webapp.properties.path=/toop-dir/smp/config/webapp.properties -Dsmp.server.properties.path=/toop-dir/smp/config/smp-server.properties -Dpd.client.properties.path=/toop-dir/smp/config/pd-client.properties" \
    CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -Djava.security.egd=file:/dev/urandom"

RUN mkdir /supplementaryFiles

COPY default-* /supplementaryFiles/

COPY prepare-and-run.sh  /

WORKDIR  /

RUN echo "Downloading phoss SMP from $SMP_URL" && \
    wget $SMP_URL -O smp.zip  && \
    unzip smp.zip -d /smpsetup/  && \
    rm -fr $CATALINA_HOME/webapps && \
    mkdir -p $CATALINA_HOME/webapps && \
    cp -r /smpsetup/ $CATALINA_HOME/webapps/ROOT && \
    rm -fr smpsetup smp.zip && \
    chmod  +x  ./prepare-and-run.sh  

# Ensure the truststore is present - do it after unzipping to ensure the folder is present
COPY playground-truststore-v4.1.jks $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/

CMD ["./prepare-and-run.sh"]
