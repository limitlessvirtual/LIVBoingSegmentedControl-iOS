Pod::Spec.new do |s|

  s.name         = "LIVBoingSegmentedControl"
  s.version      = "1.0.0"
  s.summary      = "An animated and customisable segment menu for iOS8."
  s.description  = "An animated segment menu using the pop animation library (https://github.com/facebook/pop). The menu is fully customizable in terms of number of segments, selected and unselected colors, selector image, selector velocity etc."
  s.homepage     = "https://github.com/limitlessvirtual/LIVBoingSegmentedControl-iOS"
  s.license      = "MIT"
  s.author             = { "limitlessvirtual" => "info@limitlessvirtual.com" }
  s.platform     = :ios, "8.0"
  s.source_files  = "LIVBoingSegmentedControl"
  s.source       = { :git => "https://github.com/limitlessvirtual/LIVBoingSegmentedControl-iOS.git", :tag => "v1.0.0" }
  s.dependency 'pop', '~> 1.0.7'
  s.requires_arc = true

end







