Pod::Spec.new do |s|
  s.name         = "PGMenu"
  s.version      = "0.1.0"
  s.summary      = "A Menu component for you awesome apps!"
  s.homepage     = "https://github.com/pablogsIO/PGMenu"
  s.license      = 'MIT'
  s.author       = "Pablo Garcia"
  s.source       = { :git => "https://github.com/pablogsIO/PGMenu.git", :tag => s.version }
  s.platform     = :ios, '10.0'
  s.source_files = 'Source/*.swift'
  s.frameworks   = 'UIKit'
  s.swift_version= '4.2'
  s.requires_arc = true
end
