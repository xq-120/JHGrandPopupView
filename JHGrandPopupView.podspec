Pod::Spec.new do |spec|

  spec.name         = "JHGrandPopupView"
  spec.version      = "1.0.2"
  spec.summary      = "弹窗."
  spec.description  = <<-DESC
                    JHGrandPopupView是一个自定义程度非常高的弹窗组件。它对外提供一个容器视图，因此开发者可以完全自定义弹窗内容。
                    同时JHGrandPopupView封装了弹窗的显示与隐藏，并提供了两种默认的动画效果，子类可通过重写的方式扩展动画效果。
                    DESC
  spec.homepage     = "https://github.com/xq-120/JHGrandPopupView"

  spec.license      = "MIT"

  spec.author       = { "jekyttt" => "1204556447@qq.com" }
  
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/xq-120/JHGrandPopupView.git", :tag => "#{spec.version}" }

  spec.source_files = "JHGrandPopupView/*.{h,m}"

  spec.frameworks   = "Foundation", "UIKit"

  spec.requires_arc = true

end
