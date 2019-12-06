!/bin/bash
echo "BUILDUNG AND RUNNNING TESTS"
xcodebuild -project 'Numero.xcodeproj' -scheme 'Numero' -destination 'platform=iOS Simulator,name=iPhone 8' test | tee xcodebuild.log | /usr/local/bin/xcpretty --no-color && exit ${PIPESTATUS[0]}
echo "BUILDING RELEASE"
xcodebuild -project 'Numero.xcodeproj' -scheme 'Numero' -destination 'generic/platform=iOS' -configuration Release build CODE_SIGNING_ALLOWED=NO | tee xcodebuild.log | /Susr/local/bin/xcpretty --no-color && exit ${PIPESTATUS[0]}
