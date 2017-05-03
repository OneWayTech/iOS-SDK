
Pod::Spec.new do |s|

  s.name         = 'OneWaySDK'
  s.version      = '1.3.0'
  s.summary      = 'OneWaySDK for video ads'

  s.description  = <<-DESC
    It is a video-ads SDK on iOS, which implement by Objective-C.
    DESC

  s.homepage     = 'https://www.oneway.mobi'

    s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the 'License');
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an 'AS IS' BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
}

  s.author             = { 'lch' => 'lch872@qq.com' }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/OneWayTech/iOS-SDK.git",:tag => s.version }


    s.source_files  = 'OneWaySDK/*.h'
    s.requires_arc = true
    s.vendored_libraries = 'OneWaySDK/libOneWaySDK.a'
    s.xcconfig = { 'OTHER_LDFLAGS' => '-all_load' }
end
