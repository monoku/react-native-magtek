Pod::Spec.new do |s|
  s.name         = 'MTSCRA'
  s.version      = "0.0.2"
  s.summary      = "The Magtek iOS SDK"
  s.homepage     = 'https://www.magtek.com/'
  s.platform     = :ios
  s.author       = ''
  s.source = { :path => "." }
  s.frameworks = %w(AVFoundation AudioToolbox CoreBluetooth ExternalAccessory)
  s.libraries = %w()
  s.vendored_libraries = "libMTSCRA.a"
  s.source_files = "MTSCRA.h"
  s.public_header_files = "MTSCRA.h"
end
