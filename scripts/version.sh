#!/bin/bash

CURR_VERSION=hello_world-v`awk '/^version: /{print $2}' packages/hello_world/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_hello_world/ios/flutter_hello_world.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_hello_world/macos/flutter_hello_world.podspec
rm packages/flutter_hello_world/macos/*.bak packages/flutter_hello_world/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_hello_world/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_hello_world/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_hello_world/
