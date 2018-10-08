#!/bin/bash

set -eux

open -b com.apple.iphonesimulator
set -o pipefail && env NSUnbufferedIO=YES

xcodebuild test \
    -workspace ReaderExample.xcworkspace \
    -scheme ReaderExample \
    -sdk iphonesimulator \
    -destination "platform=iOS Simulator,name=iPhone 6s" | xcpretty
