
Pod::Spec.new do |s|
  s.name         = 'Baidu4210'
  s.version      = '4.2.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.summary      = '百度地图.'
  s.homepage     = 'https://github.com/BaiduLBS/BaiduMapKit.git'
  s.author       = 'baidu'
  s.source       = { :git => 'hhttps://github.com/xialina/Baidu4210.git'}

  s.requires_arc = true






  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
end
