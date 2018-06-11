FROM ubuntu

#apt-get parts
RUN apt-get update  && \
    apt-get install -y wget && \
    apt-get install -y vim && \
    apt-get install -y unzip && \
    apt-get clean && \
    apt-get autoremove

ARG JAVA_HOME=/jdk_home

ENV JAVA_HOME="$JAVA_HOME" \
    JRE_HOME="$JAVA_HOME" \
    JDK_HOME="$JAVA_HOME" \
    PATH=${PATH}:${JAVA_HOME}/bin
    
WORKDIR /
    
ADD SimpleHttp.java /

ADD setup.sh /

RUN /setup.sh

LABEL vendor="@yerlibilgin"

EXPOSE 8080

CMD ["java", "SimpleHttp", "8080"]
