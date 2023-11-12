function gradle-install --wraps='JAVA_HOME=/opt/android-studio/jre ./gradlew installDebug -x lintVitalAnalyzeRelease -x lintAnalyzeDebug -x lintDebug' --description 'alias gradle-install=JAVA_HOME=/opt/android-studio/jre ./gradlew installDebug -x lintVitalAnalyzeRelease -x lintAnalyzeDebug -x lintDebug'
  JAVA_HOME=/opt/android-studio/jre ./gradlew installDebug -x lintVitalAnalyzeRelease -x lintAnalyzeDebug -x lintDebug $argv; 
end
