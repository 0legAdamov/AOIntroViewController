Pod::Spec.new do |spec|
  spec.name         = 'AOIntroViewController'
  spec.version      = '1.0'
  spec.summary      = 'Swift library for show simple intro.'
  spec.homepage     = 'https://github.com/0legAdamov/AOIntroViewController'
  spec.author       = { 'Digital Expansion' => 'de@ad1.ru' }
  spec.source       = { :git => 'https://github.com/0legAdamov/AOIntroViewController.git', :tag => "v#{spec.version}" }
  spec.source_files = 'Source/*.swift'
  spec.requires_arc = true
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.ios.deployment_target = "8.0"
end
