
  Pod::Spec.new do |s|
    s.name = 'CapacitorPluginWechat'
    s.version = '0.0.1'
    s.summary = 'wechat login andSoOn.'
    s.license = 'MIT'
    s.homepage = 'https://github.com/chxy85/capacitor-plugin-wechat.git'
    s.author = 'vtychx'
    s.source = { :git => 'https://github.com/chxy85/capacitor-plugin-wechat.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end