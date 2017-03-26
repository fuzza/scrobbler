# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CriolloKit/CocoaPodsSpecs'
source 'https://github.com/CocoaPods/Specs.git'

target 'LastFMScrobbler' do
  use_frameworks!

  pod 'CriolloKitDI'
  pod 'Overcoat/ReactiveCocoa'
  pod 'Masonry'
  pod 'SSDataSources'
  pod 'PINRemoteImage'
  pod 'MBProgressHUD'
  
  target 'LastFMScrobblerTests' do
    inherit! :search_paths
    pod 'Expecta'
    pod 'OCMock'
  end

end
