#
# Be sure to run `pod lib lint MRestClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MRestClient'
  s.version          = '0.1.0'
  s.summary          = 'MRestClient is the HTTP client implementation library written in swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"MRestClient is the HTTP client implementation library written in swift, It is small , light weight & simple to use library for HTTP communication .The goal of this library is to reduce the effort to call REST-API with swift codable object. This is the generic implementation of swift object for request & response body so you can directly interact with codable object without worrying JSON conversion"
                       DESC

  s.homepage         = 'https://github.com/afsaredrisy/MRestClient'
  #s.screenshots     = 'https://github.com/afsaredrisy/MRestClient/blob/master/demo_screen.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'afsaredrisy' => 'afsaredrisz@icloud.com' }
  s.source           = { :git => 'https://github.com/afsaredrisy/MRestClient.git', :tag => s.version.to_s }
  s.social_media_url = 'https://github.com/afsaredrisy'

   s.ios.deployment_target = '11.0'
   s.swift_version = '5.0'
   s.source_files = 'Source/**/*'

  #s.source_files = 'MRestClient/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MRestClient' => ['MRestClient/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
