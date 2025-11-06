# Gradle Wrapper Installer

A simple script to quickly set up the Gradle wrapper (`gradlew`) for any project.

## Features

- Works on Linux, macOS, and Windows (via Git Bash/WSL)
- Lets you choose the Gradle version at runtime
- Minimal setup: creates `gradlew` and `gradle/wrapper` folder
- No dependencies besides Java and curl

## Usage

1. Clone or download this repository
2. Make the script executable (if needed):
   `chmod +x setup-gradle-wrapper.sh`
3. Run the script:
   `./setup-gradle-wrapper.sh`
4. Enter the desired Gradle version when prompted
5. Use the wrapper to run Gradle commands:
   `./gradlew tasks`
