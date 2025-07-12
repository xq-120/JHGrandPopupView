Pod::Spec.new do |spec|

  spec.name         = "JHGrandPopupView"
  spec.version      = "1.6.0"
  spec.summary      = "弹窗."
  spec.description  = <<-DESC
                    JHGrandPopupView是一个自定义程度非常高的弹窗组件。它对外提供一个容器视图，因此开发者可以完全自定义弹窗内容。
                    同时JHGrandPopupView封装了弹窗的显示与隐藏，并提供了两种默认的动画效果，开发者可实现自己的动画效果。
                    DESC
  spec.homepage     = "https://github.com/xq-120/JHGrandPopupView"
  spec.license      = "MIT"
  spec.author       = { "jekyttt" => "1204556447@qq.com" }
  
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/xq-120/JHGrandPopupView.git", :tag => "#{spec.version}" }

  spec.source_files = 'JHGrandPopupView/JHGrandPopupKit.h'
  
  spec.subspec 'Core' do |ss|
    ss.source_files = 'JHGrandPopupView/Core/*.{h,m}'
  end
  
  spec.subspec 'Plugins' do |ss|
    ss.source_files = 'JHGrandPopupView/Plugins/*.{h,m}'
    ss.dependency 'JHGrandPopupView/Core'
  end
    
  spec.subspec 'Animations' do |ss|
    ss.source_files = 'JHGrandPopupView/Animations/*.{h,m}'
    ss.dependency 'JHGrandPopupView/Core'
  end

  spec.frameworks   = "Foundation", "UIKit"
  spec.requires_arc = true
  spec.dependency "Masonry", '~> 1.1.0'

  spec.pod_target_xcconfig = {
    'IPHONEOS_DEPLOYMENT_TARGET' => '10.0'
  }
end
