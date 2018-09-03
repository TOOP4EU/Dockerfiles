FROM ubuntu

#apt-get parts
RUN apt-get update  && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y unzip && \
    apt-get clean && \
    apt-get autoremove

ARG JAVA_HOME=/jdk_home
ARG TOMCAT_URL=http://ftp.itu.edu.tr/Mirror/Apache/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz
ARG JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
ARG CATALINA_HOME=/tomcat

#JDK
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" $JDK_URL && \
    tar -xvzf jdk-8u181-linux-x64.tar.gz && \
    ln -s /jdk1.8.0_181 $JAVA_HOME && \
    rm -fr jdk-8u181-linux-x64.tar.gz && \
    for m in libjfxwebkit.so src.zip javafx-src.zip missioncontrol visualvm; \
    do \
       find -L $JAVA_HOME -name $m; \
       find -L $JAVA_HOME -name $m | xargs rm -fr; \
    done && \
    chmod +x $JAVA_HOME/bin/java && \
    chmod +x $JAVA_HOME/bin/javac
    
#TOMCAT

RUN mkdir $CATALINA_HOME && \
    cd $CATALINA_HOME && \
    wget $TOMCAT_URL -O tomcat.tar.gz  && \
    tar -xvzf tomcat.tar.gz -C . --strip-components 1 && \
    rm -fr tomcat.tar.gz && \
    cd $CATALINA_HOME/webapps && \
    rm -r ROOT && \
    rm -r docs && \
    rm -r examples



ENV JAVA_HOME="$JAVA_HOME" \
    JRE_HOME="$JAVA_HOME" \
    JDK_HOME="$JAVA_HOME" \
    TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.33 \
    CATALINA_HOME=${CATALINA_HOME} \
    PATH=${JAVA_HOME}/bin:${CATALINA_HOME}/bin:$PATH

LABEL vendor="@yerlibilgin"

EXPOSE 8080

WORKDIR $CATALINA_HOME

CMD ["catalina.sh", "run"]

