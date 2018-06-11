external_port="8080"

docker build --network="host" --build-arg TC_PORT=$external_port -t toop/toop-connector-webapp:0.9.1 .
