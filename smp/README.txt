toop/phoss-smp:5.2.3 docker image build and run scripts

1. To build the image
    ./build.sh
    
2. To run the image and create a container with default values 
    ./run.sh
    
    This command will use  parameters jdk_volume=jdk_home, toop_dir=toop-dir,  external_port=8080 as default. 
        jdk_volume=jdk_home: The container will use a NAMED VOLUME "jdk_home" (that must be previously mapped
        to another container that serves the JDK.
        toop_dir=toop-dir : The container will use ABSOLUTE_PATH_TO_CURRENT_DIR/toop-dir and create that folder
        in the current directory (if it doesn't exist) and map it to the /toop-dir in the container.
        external_port=8080: The container will publish its internal default connector port (which is also 8080)
        to the localhost (the HOST machine) on port 8080.
        
3. To run the image and create a container with custom values

    ./run.sh another_jdk_volume_name   ../my-dirs/my-toop-dir 9876
    
    This will run the container assuming that a NAMED volume another_jdk_volume_name exists and will map it to
    the /jdk_home dir on the container. 
    It will convert the ../my-dirs/my-toop-dir to an absolute path and provide it as /toop-dir to the container.
    And the internal 8080 port will be mapped to the localhost:9876 port.
    
    
    the ./run.sh script will create a container with name "smp". You can also parameterize it to create multiple 
    containers from the same image.

4. to stop the container
    docker stop smp
    
    
Other files:
1. smp-setup.sh: This script is used ruing the build stage. It downloads and installs the smp server war file into the image being built.
2. tomcat-setup.sh:  This script is used ruing the build stage. It downloads and installs apache tomcat into the the image being built.
3. prepare-and-run.sh: This script is built into the image. It is used during the launching of the servers. It checks and creates the toop-dir and fills the sub directories with the config files and creates the whole /toop-dir/smp folder structures and then runs 'catalina.sh run'.
