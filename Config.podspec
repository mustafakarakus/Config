Pod::Spec.new do |spec|

  spec.name         = "Config"
  spec.version      = "2.0.0"
  spec.summary      = "Use a JSON file as an app configuration, reach keys with dot notation, written in Swift"

  spec.description  = <<-DESC
  Config is a framework written in Swift that makes it easy for you to use JSON file as a configuration, with JSON keys in dot notation in your application.
                   DESC

  spec.homepage     = "https://github.com/mustafakarakus/Config"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Mustafa" => "karakusmustafa@gmail.com" }

  spec.ios.deployment_target = "15.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/mustafakarakus/Config.git", :tag => "#{spec.version}" }
  spec.source_files  = "Config/**/*.{h,m,swift}"

end 