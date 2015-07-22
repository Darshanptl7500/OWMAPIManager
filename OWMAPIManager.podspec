Pod::Spec.new do |s|

  s.name         = "OMWAPIManager"
  s.version      = "1.0"
  s.summary      = "OWMAPIManager is an open-source iOS Objective-C library for fetching weather information of OpenWeatherMap using simple blocks based API callbacks."

  s.description  = <<-DESC
				   Its Main purpose is to use OpenWeatherMap API requests with ease in a less lines of code. 

				   This includes following:

				    - [Current weather data] (Access current weather data for any location on Earth)
				    - [5 day / 3 hour forecast] (5 day forecast informations)
				    - [Call 16 day / daily forecast data] (16 day forecasts/daily forecast informations)
                   DESC

  s.homepage     = "https://github.com/Darshanptl7500/OMWAPIManager"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Darshan Patel" => "developer.ios89@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Darshanptl7500/OMWAPIManager.git",
                     :tag => s.version.to_s }
  s.source_files = 'OMWAPIManager/*.{h,m}'
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 2.2'

end
