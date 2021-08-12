#
#  Be sure to run `pod spec lint libFFmpeg-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name          = 'libFFmpeg-iOS'
  spec.version       = '4.0c'
  spec.summary       = "ffmpeg libraries for iOS."
  spec.homepage      = "https://github.com/GWTimes/#{spec.name}"
  # spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "JonorZhang" => "zyx1507@163.com" }

  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  spec.platform      = :ios, "9.0"
  spec.requires_arc  = true
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

  spec.default_subspecs = ['ffmpeg', 'avcodec', 'avfilter', 'avformat', 'avutil', 'swresample', 'swscale', 'openssl']

  spec.header_mappings_dir = "include"

  spec.subspec 'ffmpeg' do |ss| 
    ss.source_files        = "include/libffmpeg/**/*.h"
    ss.public_header_files = "include/libffmpeg/**/*.h"
  end

  spec.subspec 'avcodec' do |ss| 
    ss.vendored_libraries  = "lib/libavcodec.a"
    ss.source_files        = "include/{libavcodeclibffmpe*/*.h", 
    ss.public_header_files = "include/libavcodec/**/*.h"
  end

  spec.subspec 'avfilter' do |ss| 
    ss.vendored_libraries  = "lib/libavfilter.a"
    ss.source_files        = "include/libavfilter/**/*.h"
    ss.public_header_files = "include/libavfilter/**/*.h"
  end

  spec.subspec 'avformat' do |ss| 
    ss.vendored_libraries  = "lib/libavformat.a"
    ss.source_files        = "include/libavformat/**/*.h"
    ss.public_header_files = "include/libavformat/**/*.h"
  end

  spec.subspec 'avutil' do |ss| 
    ss.vendored_libraries  = "lib/libavutil.a"
    ss.source_files        = "include/libavutil/**/*.h"
    ss.public_header_files = "include/libavutil/**/*.h"
  end

  spec.subspec 'swresample' do |ss| 
    ss.vendored_libraries  = "lib/libswresample.a"
    ss.source_files        = "include/libswresample/**/*.h"
    ss.public_header_files = "include/libswresample/**/*.h"
  end

  spec.subspec 'swscale' do |ss| 
    ss.vendored_libraries  = "lib/libswscale.a"
    ss.source_files        = "include/libswscale/**/*.h"
    ss.public_header_files = "include/libswscale/**/*.h"
  end

  spec.subspec 'openssl' do |ss| 
    ss.vendored_libraries  = "lib/{libssl,libcrypto}.a"
    ss.source_files        = "include/openssl/**/*.h"
    ss.public_header_files = "include/openssl/**/*.h"
  end

end

