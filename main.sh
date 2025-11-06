#!/bin/bash
set -e

echo "=========================================="
echo "Gradle Wrapper Setup Script"
echo "=========================================="

# Ask for Gradle version
read -p "Enter Gradle version to install (e.g., 8.8): " GRADLE_VERSION
if [ -z "$GRADLE_VERSION" ]; then
    echo "No version entered, defaulting to 8.8"
    GRADLE_VERSION="8.8"
fi

# Create Gradle wrapper directories
mkdir -p gradle/wrapper

# Download gradle-wrapper.jar
curl -L -o gradle/wrapper/gradle-wrapper.jar \
    https://raw.githubusercontent.com/gradle/gradle/master/gradle/wrapper/gradle-wrapper.jar

# Create gradle-wrapper.properties
cat > gradle/wrapper/gradle-wrapper.properties << EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF

# Create minimal gradlew script
cat > gradlew << 'EOF'
#!/bin/sh
CLASSPATH=$PWD/gradle/wrapper/gradle-wrapper.jar
exec java -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
EOF

chmod +x gradlew

echo "✓ Gradle wrapper installed successfully for version $GRADLE_VERSION!"
echo "You can now run: ./gradlew tasks"
