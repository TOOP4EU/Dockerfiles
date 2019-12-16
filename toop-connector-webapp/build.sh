version=0.10.6-2

docker build --build-arg TOOP_CONNECTOR_VERSION=$version -t toop/toop-connector-webapp:$version .
