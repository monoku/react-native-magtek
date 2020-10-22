require "json"

package = JSON.parse(File.read(File.join(__dir__, "../package.json")))

Pod::Spec.new do |s|
  s.name             = "RNMagtek"
  s.version          = package["version"]
  s.summary          = package["description"]
  s.author           = package["author"]
  s.homepage         = package["homepage"]
  s.license          = package["license"]
  s.platform         = :ios, "7.0"
  s.source           = { :git => "https://github.com/monoku/react-native-magtek.git", :tag => "#{s.version}" }
  s.source_files     = "*.{h,m}"
  s.requires_arc     = true
  s.static_framework = true

  s.dependency "React"
  s.dependency "MTSCRA"
end