Pod::Spec.new do |s|

  s.platform = :ios, "9.0"
  s.name         = "ZLayout"
  s.version      ="0.0.1"
  s.summary      = "A lightweight framework for layout views"
  s.description  = "A lightweight framework for layout views"
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Igor Zarubin" => "izarubinn@gmail.com" }

  s.source       = { :git => "https://github.com/fanticqq/ZLayout.git", :tag => "#{s.version}" }

  s.source_files  = "Source/*.swift"

  s.requires_arc = true

end
