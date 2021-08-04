#
#  Be sure to run `pod spec lint libFFmpeg3.4-SSL-IoTVideo-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name          = 'libFFmpeg-SSL-iOS'
  spec.version       = '3.4'
  spec.summary       = "ffmpeg libs with SSL."
  spec.description   = "ffmpeg libs with SSL for iOS, including armv7 arm64 and x86_64 archs."
  spec.homepage      = "https://github.com/GWTimes/libFFmpeg-SSL-iOS"
  # spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "JonorZhang" => "zyx1507@163.com" }

  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  spec.platform      = :ios, "9.0"
  spec.requires_arc  = true
  spec.source        = { :http => "https://github.com/GWTimes/libFFmpeg-SSL-iOS/archive/refs/tags/#{spec.version}.zip" }

  spec.vendored_libraries  = "libFFmpeg-SSL-iOS-#{spec.version}/lib/*.a"
  spec.public_header_files = "libFFmpeg-SSL-iOS-#{spec.version}/include/*.h"
end

