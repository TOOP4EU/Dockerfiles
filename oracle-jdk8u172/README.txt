Building and running toop/jdk-8u172-stripped image.

1. To build the image
    ./build.sh 
    
2. To run the image and create a container with name jdk
    ./run.sh
    
    This command will run the toop/jdk-8u172-stripped image, map its internal /jdk_home directory to a named 
    volume jdk_home and bind the internal 8080 port to port 10000 on the host machine.
    you can type 
        curl localhost:10000
        to test the simple "JRE IS UP" server.
        
4. to stop the container
    docker stop jdk
    
    
Other files:
1. setup.sh: This is used during the build stage. It downloads and installs jdk, removes unnecessary files like
the damn libjfxwebkit.so file (which is 80mega bytes) and creates the /jdk_home directory internally.
2. SimpleHttp.java: A simple http server that responds with a "JRE IS UP" and java --version result. It doesn't
use any external dependency (no jars, no maven, no jetty and so on). It can be compiled with
"javac SimpleHttp.java" and run with "java SimpleHttp 8080".
