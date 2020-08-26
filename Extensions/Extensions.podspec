Pod::Spec.new do |s|

s.authors      = { '' => '' }
s.license      = { :type => '.' }
s.homepage     = '.'
s.source       = { :git => '', :tag => '0.0.1' }
s.summary      = '.'

s.name                  = "Extensions"
s.platform              = :ios
s.ios.deployment_target = '10.0'
s.requires_arc          = true
s.resources             = "Source/**/*.xcassets" 
s.version               = "0.0.1"

s.subspec 'TwkExtensions' do |sp|
  sp.source_files = 'Source/Extensions/*.swift'
end

s.subspec 'TwkUIKit' do |sp|
  sp.source_files = 'Source/CustomViews/*.swift'
end

s.default_subspecs = "TwkUIKit", "TwkExtensions"
s.dependency 'Themes'

end
