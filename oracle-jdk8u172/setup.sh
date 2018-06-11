wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz

tar -xvzf jdk-8u172-linux-x64.tar.gz

ln -s /jdk1.8.0_172 $JDK_HOME
rm -fr jdk-8u172-linux-x64.tar.gz

#clean the gigantic files that will never be used
for m in libjfxwebkit.so src.zip javafx-src.zip missioncontrol visualvm
do
  #jdk home is a symbolic link. So -L is necessary
  find -L $JDK_HOME -name $m
  find -L $JDK_HOME -name $m | xargs rm -fr
done


chmod +x $JDK_HOME/bin/java
chmod +x $JDK_HOME/bin/javac
#compile the simple server code
javac SimpleHttp.java
