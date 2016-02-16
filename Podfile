source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/artsy/Specs.git'

platform :ios, '8.0'
use_frameworks!

target 'Epsilon' do
  pod 'Artsy+UIColors'
  pod 'Artsy+UILabels'
  pod 'Artsy-UIButtons'

  if ['orta', 'ash', 'artsy', 'Laura', 'CI', 'distiller'].include?(ENV['USER'])
      pod 'Artsy+UIFonts', '~> 1.1.0'
  else
      pod 'Artsy+OSSUIFonts', '~> 1.1.0'
  end

  pod 'Cartography', :git => "https://github.com/robb/Cartography.git", :branch => "swift-2.0"
  pod "RxSwift", :git => "https://github.com/ReactiveX/RxSwift.git"
  pod "RxCocoa", :git => "https://github.com/ReactiveX/RxSwift.git"
  pod "HockeySDK-Source"
end

target 'EpsilonTests' do
  pod 'Quick'
  pod 'Nimble'
  pod 'Forgeries'
end
