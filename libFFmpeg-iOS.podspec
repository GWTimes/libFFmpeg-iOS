#
#  Be sure to run `pod spec lint libFFmpeg-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name          = 'libFFmpeg-iOS'
  spec.version       = '4.0e'
  spec.summary       = "ffmpeg libraries for iOS."
  spec.homepage      = "https://github.com/GWTimes/#{spec.name}"
  # spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "JonorZhang" => "zyx1507@163.com" }

  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  spec.platform      = :ios, "9.0"
# spec.source        = { :http => "https://github.com/GWTimes/#{spec.name}/archive/refs/tags/#{spec.version}.zip" }
  spec.source        = { :git => "https://gitlab.gwell.cc/iospublic/#{spec.name}.git", :tag => "#{spec.version}" }

  # spec.prepare_command = <<-CMD
  #   zipdir="#{spec.name}-#{spec.version}"
  #   if [ -d "./include" ] && [ -d "./lib" ]; then
  #     echo "local path"
  #   else
  #     echo "remote download"
  #     if [ -d ${zipdir} ]; then
  #       mv ${zipdir}/* .
  #       rm -rf ${zipdir}
  #     else
  #       echo "💔💔error ${zipdir}"
  #       say -v Mei-Jia "文件预处理失败"
  #     fi
  #   fi
  # CMD

  spec.subspec 'ffmpeg' do |ss|

    ss.subspec 'include' do |ssp|
      ssp.source_files        = 'include/ffmpeg/**/*.h'
      ssp.public_header_files = 'include/ffmpeg/**/*.h'
      ssp.header_mappings_dir = 'include/ffmpeg'
    end

    ss.subspec 'lib' do |ssp|
      ssp.vendored_libraries  = 'lib/ffmpeg/**/*.a'
    end
  
  end

  spec.subspec 'openssl' do |ss|
    
    ss.subspec 'include' do |ssp|
      ssp.source_files        = 'include/openssl/**/*.h'
      ssp.public_header_files = 'include/openssl/**/*.h'
      ssp.header_mappings_dir = 'include'
    end

    ss.subspec 'lib' do |ssp|
      ssp.vendored_libraries  = 'lib/openssl/**/*.a'
    end

  end
  
end

