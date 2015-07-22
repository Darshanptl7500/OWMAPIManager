Pod::Spec.new do |s|

  s.name         = "OWMAPIManager"
  s.version      = "1.0.1"
  s.summary      = "OWMAPIManager is an open-source iOS Objective-C library for fetching weather information of OpenWeatherMap using simple blocks based API callbacks."

  s.description  = <<-DESC
				   Its Main purpose is to use OpenWeatherMap API requests with ease in a less lines of code.
                   DESC
  s.homepage     = "https://github.com/Darshanptl7500/OWMAPIManager"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Darshan Patel" => "developer.ios89@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Darshanptl7500/OWMAPIManager.git",
                     :tag => s.version.to_s }
  s.source_files = 'OWMAPIManager/*.{h,m}'
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 2.2'

end
