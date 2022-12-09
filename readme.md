
## User settings
xcuserdata/

## Obj-C/Swift specific
*.hmap

## App packaging
*.ipa
*.dSYM.zip
*.dSYM

## Playgrounds
timeline.xctimeline
playground.xcworkspace

# Swift Package Manager
#
# Add this line if you want to avoid checking in source code from Swift Package Manager dependencies.
# Packages/
# Package.pins
# Package.resolved
# *.xcodeproj
#
# Xcode automatically generates this directory with a .xcworkspacedata file and xcuserdata
# hence it is not needed unless you have added a package configuration file to your project
.swiftpm

.build/

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
#
# Pods/
#
# Add this line if you want to avoid checking in source code from the Xcode workspace
 *.xcworkspace

# Carthage
#
# Add this line if you want to avoid checking in source code from Carthage dependencies.
Carthage/Checkouts

Carthage/Build/

# Accio dependency management
Dependencies/
.accio/

# fastlane
#
# It is recommended to not store the screenshots in the git repo.
# Instead, use fastlane to re-generate the screenshots whenever they are needed.
# For more information about the recommended setup visit:
# https://docs.fastlane.tools/best-practices/source-control/#source-control

fastlane/report.xml
fastlane/Preview.html
fastlane/screenshots/**/*.png
fastlane/test_output

# Code Injection
#
# After new code Injection tools there's a generated folder /iOSInjectionProject
# https://github.com/johnno1962/injectionforxcode

iOSInjectionProject/

error project: Failed to resolve dependencies Dependencies could not be resolved because no versions of 'realm-core' match the requirement 12.9.0 and root depends on 'realm-swift' 10.32.0..<11.0.0.
'realm-swift' >= 10.32.0 practically depends on 'realm-core' 12.9.0 because no versions of 'realm-core' match the requirement 12.13.0 and 'realm-swift' 10.32.0 depends on 'realm-core' 12.9.0.
'realm-swift' >= 10.32.1 practically depends on 'realm-core' 12.13.0 because no versions of 'realm-core' match the requirement 12.11.0 and 'realm-swift' 10.33.0 depends on 'realm-core' 12.13.0.
'realm-swift' {10.32.1..<10.33.0, 10.33.1..<11.0.0} practically depends on 'realm-core' 12.11.0 because 'realm-swift' 10.32.2 depends on 'realm-core' 12.11.0 and 'realm-swift' 10.32.3 depends on 'realm-core' 12.11.0.
'realm-swift' {10.32.1..<10.32.2, 10.32.4..<10.33.0, 10.33.1..<11.0.0} practically depends on 'realm-core' 12.11.0 because 'realm-swift' 10.32.1 depends on 'realm-core' 12.11.0.
'realm-swift' {10.32.1, 10.32.4..<10.33.0, 10.33.1..<11.0.0} practically depends on 'realm-core' 12.11.0 because no versions of 'realm-swift' match the requirement {10.32.4..<10.33.0, 10.33.1..<11.0.0} and 'realm-swift' 10.32.1 depends on 'realm-core' 12.11.0.
