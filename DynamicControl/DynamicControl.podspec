Pod::Spec.new do |s|

s.authors      = { '' => '' }
s.license      = { :type => '.' }
s.homepage     = '.'
s.source       = { :git => '', :tag => '0.0.1' }
s.summary      = '.'

s.name                  = "DynamicControl"
s.platform              = :ios
s.ios.deployment_target = '10.0'
s.requires_arc          = true
s.resources             = "Source/**/*.storyboard" , "Source/**/*.xcassets" 
s.source_files          = "Source/**/*.{swift}"
s.version               = "0.0.1"

s.framework = "UIKit"
s.dependency 'Extensions'
s.dependency 'JGProgressHUD'
end
