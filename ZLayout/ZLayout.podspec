Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name         = "ZLayout"
  s.version      ="1.0.0"
  s.summary      = "A lightweight framework for layout views"
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = "https://github.com/fanticqq/ZLayout"

  s.author             = { "Igor Zarubin" => "izarubinn@gmail.com" }

  s.source       = { :git => "https://github.com/fanticqq/ZLayout.git", :tag => "#{s.version}" }

  s.source_files  = "Source/*.swift"
  s.framework = "Foundation", "UIKit"
  s.requires_arc = true

end
