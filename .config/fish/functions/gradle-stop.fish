function gradle-stop --wraps='JAVA_HOME=/opt/android-studio/jre ./gradlew --stop' --description 'alias gradle-stop=JAVA_HOME=/opt/android-studio/jre ./gradlew --stop'
  JAVA_HOME=/opt/android-studio/jre ./gradlew --stop $argv; 
end
