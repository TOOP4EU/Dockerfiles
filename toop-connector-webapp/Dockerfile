#
# Copyright (C) 2018-2019 toop.eu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM tomcat:9-jdk11

ARG TOOP_CONNECTOR_VERSION
ARG TC_WAR_URL=https://repo1.maven.org/maven2/eu/toop/tc-webapp/${TOOP_CONNECTOR_VERSION}/tc-webapp-${TOOP_CONNECTOR_VERSION}.war
ARG TC_WAR_NAME=tc-webapp-${TOOP_CONNECTOR_VERSION}.war

ARG TOOP_DIR="/toop-dir"
ARG TC_CONFIG_LOCATION=${TOOP_DIR}/tc/config
ARG TC_CONFIG_FILE=${TC_CONFIG_LOCATION}/application.properties

COPY default-application.properties prepare-and-run.sh /

#create tc webapp folder
WORKDIR $CATALINA_HOME/webapps

ENV TC_PORT=$TC_PORT \
    TC_WAR_URL=$TC_WAR_URL \
    TC_WAR_NAME=$TC_WAR_NAME \
    TOOP_DIR=${TOOP_DIR} \
    TC_CONFIG_LOCATION=${TC_CONFIG_LOCATION} \
    TC_CONFIG_FILE=${TC_CONFIG_FILE} \
    TOOP_CONNECTOR_VERSION=${TOOP_CONNECTOR_VERSION} \
    CATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/urandom"


#ADD tc-webapp-${TOOP_CONNECTOR_VERSION}.war ./

RUN rm -fr manager host-manager docs examples ROOT && \
    echo "Downloading connector from $TC_WAR_URL" && \
    wget $TC_WAR_URL && \
    unzip $TC_WAR_NAME -d ROOT  && \
    rm -fr $TC_WAR_NAME  && \
    chmod +x /prepare-and-run.sh 

WORKDIR /

#run connector setup
CMD ["/prepare-and-run.sh"]
