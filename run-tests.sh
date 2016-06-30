rm xcodebuild.log

set -eux

time \
    xcodebuild clean build test \
    -workspace ReaderExample.xcworkspace \
    -scheme ReaderExample \
    -destination 'platform=iOS Simulator,name=iPhone 6s' \
    | tee xcodebuild.log \
    | xcpretty --report junit
