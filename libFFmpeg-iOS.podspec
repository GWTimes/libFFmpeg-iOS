#
#  Be sure to run `pod spec lint libFFmpeg-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name          = 'libFFmpeg-iOS'
  spec.version       = '4.0d'
  spec.summary       = "ffmpeg libraries for iOS."
  spec.homepage      = "https://github.com/GWTimes/#{spec.name}"
  # spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "JonorZhang" => "zyx1507@163.com" }

  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  spec.platform      = :ios, "9.0"
  spec.source        = { :http => "https://github.com/GWTimes/#{spec.name}/archive/refs/tags/#{spec.version}.zip" }

  spec.prepare_command = <<-CMD
    zipdir="#{spec.name}-#{spec.version}"
    if [ -d "./include" ] && [ -d "./lib" ]; then
      echo "local path"
    else
      echo "remote download"
      if [ -d ${zipdir} ]; then
        mv ${zipdir}/* .
        rm -rf ${zipdir}
      else
        echo "error ${zipdir}"
      fi
    fi
  CMD
  
  spec.default_subspecs = ['ffmpeg-headers', 'ffmpeg-libs', 'openssl-headers', 'openssl-libs']
    
  spec.subspec 'ffmpeg-headers' do |ss|
    ss.source_files        = "include/lib*/**/*.h"
    ss.public_header_files = "include/lib*/**/*.h"
  end
  
  spec.subspec 'ffmpeg-libs' do |ss|
    ss.vendored_libraries  = "lib/lib*.a"
  end
  
  spec.subspec 'openssl-headers' do |ss|
    ss.source_files        = "include/openssl/**/*.h"
    ss.public_header_files = "include/openssl/**/*.h"
  end
  
  spec.subspec 'openssl-libs' do |ss|
    ss.vendored_libraries  = "lib/openssl/*.a"
  end
  
  spec.header_mappings_dir = "include"
  
end

