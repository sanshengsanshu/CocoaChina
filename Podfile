# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Flutter
 flutter_application_path = '../cc_flutter_module/'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'CocoaChina' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

install_all_flutter_pods(flutter_application_path)

  # Pods for CocoaChina
pod 'CYLTabBarController', '~> 1.24.0'
pod 'Texture'
pod 'Masonry'

  target 'CocoaChinaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CocoaChinaUITests' do
    # Pods for testing
  end

end
