Pod::Spec.new do |s|
  s.name = 'SwiftR'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'Swift client for SignalR'
  s.homepage = 'https://github.com/adamhartford/SwiftR'
  s.social_media_url = 'http://twitter.com/adamhartford'
  s.authors = { 'Adam Hartford' => 'adam@adamhartford.com' }
  s.source = { :git => 'https://github.com/adamhartford/SwiftR.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.source_files = '*.swift'
  s.resources = '*.js'

  s.requires_arc = true
end