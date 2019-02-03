Pod::Spec.new do |s|
  s.name         = "PGMenu"
  s.version      = "1.0.0"
  s.summary      = "Fancy and beautiful level indicator component for you awesome apps!"
  s.homepage     = "https://github.com/pablogsIO/PGLevelIndicator"
  s.license      = 'MIT'
  s.author       = "Pablo Garcia"
  s.source       = { :git => "https://github.com/pablogsIO/PGMenu.git", :tag => s.version }
  s.platform     = :ios, '10.0'
  s.source_files = 'PGSMenu/Library/*.swift'
  s.frameworks   = 'UIKit'
  s.swift_version= '4.2'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/_pablogs_'
end
