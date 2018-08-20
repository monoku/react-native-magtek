Pod::Spec.new do |s|
  s.name         = "RNMagtek"
  s.version      = "1.0.0"
  s.summary      = "RNMagtek"
  s.description  = <<-DESC
                  MagTek iOS library for React Native
                   DESC
  s.homepage     = ""
  s.license      = "UNLICENSED"
  s.author       = { "author" => "luis@monoku.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/monoku/react-native-magtek.git", :tag => "master" }
  s.source_files = "RNMagtek/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
  #s.dependency "others"

end
