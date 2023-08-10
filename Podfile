# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'swiftDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for swiftDemo

  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'SnapKit'
  pod 'Kingfisher'
  pod 'MJRefresh'
  pod 'CYLTabBarController'
  pod 'SwiftyRSA'
  pod 'KeychainAccess'
  pod 'Toast-Swift'
  pod 'JXPagingView/Paging'
  pod 'JXSegmentedView'

  target 'swiftDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'swiftDemoUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
                 end
            end
     end
  end

end
