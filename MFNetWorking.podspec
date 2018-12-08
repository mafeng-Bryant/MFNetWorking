Pod::Spec.new do |s|
  s.name             = 'MFNetWorking'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MFNetWorking.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/mafeng-Bryant/MFNetWorking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1499603656@qq.com' => 'feng.ma@patpat.com' }
  s.source           = { :git => 'https://github.com/mafeng-Bryant/MFNetWorking.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'MFNetWorking/Classes/**/*'
end
