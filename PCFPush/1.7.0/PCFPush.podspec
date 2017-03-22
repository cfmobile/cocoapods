# The value PCF_PUSH_VERSION is used as the *one source of truth* for the current version number for the whole PCF Push framework.
# If building the project via Cocoapods then the version number is propagated into the code via the _PCF_PUSH_VERSION preprocessor definition the is set up in the 's.compiler_flags' setting below.
# If building the project as a framework (i.e.: in Xcode or via the 'scripts/build.sh' script) then the build script ('scripts/build.sh') reads THIS podspec file and
# grabs the value of PCF_PUSH_VERSION and propagates it into the project via the _PCF_PUSH_VERSION preprocessor definition and the CURRENT_PROJECT_VERSION build setting (which, in turn, gets
# the version number into the Info.plist file).  Note that we don't make any attempt to get the current version number into the Info.plist when building via Cocoapods since a Cocoapods
# project doesn't use an individual Info.plist file for frameworks.

PCF_PUSH_VERSION = "1.7.0" # Update this version when you release an update to this repo.  Make sure to run 'pod update' to propagate the change into the Pods project settings.

Pod::Spec.new do |s|
  s.name         = 'PCFPush'
  s.version      = PCF_PUSH_VERSION
  s.license      = { :type => 'CUSTOM', :file => 'LICENSE' }
  s.summary      = 'Pivotal CF Mobile Services Push Client SDK for iOS'
  s.homepage     = 'https://github.com/cfmobile'
  s.authors      = 'Ergin Babani'
  s.source       = { :git => 'https://github.com/cfmobile/push-ios.git', :tag => "1.7.0-final" }
  s.framework    = "CoreLocation"
  s.requires_arc = true
  s.compiler_flags = "-D_PCF_PUSH_VERSION=\\\"#{PCF_PUSH_VERSION}\\\""

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'PCFPush/**/*.h'
  s.source_files = 'PCFPush/**/*.{h,m}'
end
