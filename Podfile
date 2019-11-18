source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def ui_pods
#  pod 'TableKit'
end

def network_pods
  
end

def default_pods
  pod 'SwiftyBeaver'
end

target 'EOSAccount' do
  default_pods
  ui_pods
end

target 'NetworkData' do
  network_pods
  default_pods
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
end

project 'EOSAccount.xcodeproj'
