function gradle-clean --wraps='JAVA_HOME=/opt/android-studio/jre ./gradlew clean' --description 'alias gradle-clean=JAVA_HOME=/opt/android-studio/jre ./gradlew clean'
  JAVA_HOME=/opt/android-studio/jre ./gradlew clean $argv; 
end
