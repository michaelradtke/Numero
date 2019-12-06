#!/bin/bash
echo "### Running tests ###"
xcodebuild -project 'Numero.xcodeproj' -scheme 'Numero' -destination 'platform=iOS Simulator,name=iPhone 8' test | tee xcodebuild.log | /usr/local/bin/xcpretty --tap --no-color --no-utf

result=${PIPESTATUS[0]}
if [ $result != 0 ]
  then
    echo "XCodeBuild failed with exit-code: " $result
    exit $result
fi

echo "### Building release ###"
xcodebuild -project 'Numero.xcodeproj' -scheme 'Numero' -destination 'generic/platform=iOS' -configuration Release build CODE_SIGNING_ALLOWED=NO | tee xcodebuild.log | /usr/local/bin/xcpretty --simple --no-color --no-utf && exit ${PIPESTATUS[0]}
