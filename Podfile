platform :ios, '10.0'


swift_32 = ['RandomKit'] # if these pods are in Swift 3.2
swift4 = [] # if these pods are in Swift 4
# swift4 = ['SwiftLint', 'Kingfisher', 'RandomKit', 'Timepiece'] # if these pods are in Swift 4

target 'HaloApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  # Pods for HaloApp
  pod 'SwiftLint'
 	pod 'SVProgressHUD'
 	# pod 'FileKit'
 	pod 'RandomKit', '~> 5.2.3'
 	pod 'Timepiece'
 	# pod 'Hero'
 	# pod 'Onboard'
 	pod 'Kingfisher'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'Cartography', '~> 3.0'

  target 'HaloAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HaloAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|

    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end

    end
    swift_version = nil

        if swift_32.include?(target.name)
            swift_version = '3.2'
        end

        if swift4.include?(target.name)
            swift_version = '4.0'
        end

        if swift_version
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = swift_version
            end
        end
  end
end


  # print "Setting the default SWIFT_VERSION to 4.0\n"
  #   installer.pods_project.build_configurations.each do |config|
  #       config.build_settings['SWIFT_VERSION'] = '4.0'
  #   end

  #   installer.pods_project.targets.each do |target|
  #       if ['SomeTarget-iOS', 'SomeTarget-watchOS'].include? "#{target}"
  #           print "Setting #{target}'s SWIFT_VERSION to 3.0\n"
  #           target.build_configurations.each do |config|
  #               config.build_settings['SWIFT_VERSION'] = '3.0'
  #           end
  #       else
  #           print "Setting #{target}'s SWIFT_VERSION to Undefined (Xcode will automatically resolve)\n"
  #           target.build_configurations.each do |config|
  #               config.build_settings.delete('SWIFT_VERSION')
  #           end
  #       end
  #   end