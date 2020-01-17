
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

    s.vendored_libraries  = 'ios/Plugin/WeChatSDK/libWeChatSDK.a'
    s.public_header_files = 'ios/Plugin/WeChatSDK/*.h','ios/Plugin/Plugin.h'
    s.libraries = 'z', 'c++', 'sqlite3.0'
    s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }

    s.static_framework = true
    s.dependency 'Capacitor'
    #s.dependency 'WechatOpenSDK'
  end