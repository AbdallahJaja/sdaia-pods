Pod::Spec.new do |s|

s.authors      = { '' => '' }
s.license      = { :type => '.' }
s.homepage     = '.'
s.source       = { :git => '', :tag => '0.0.1' }
s.summary      = '.'

s.name                  = "FakeLocationDetector"
s.platform              = :ios
s.ios.deployment_target = '10.0'
s.requires_arc          = true
s.source_files          = "Source/**/*.{swift}"
s.version               = "0.0.1"

s.dependency 'Moya/RxSwift'
s.dependency 'RxCoreLocation'
s.dependency 'Constants'

end
