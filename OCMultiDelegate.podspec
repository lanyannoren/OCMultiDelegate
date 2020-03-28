Pod::Spec.new do |spec|

  spec.name         = "OCMultiDelegate"
  spec.version      = "0.0.1"
  spec.summary      = "OC多代理"

  spec.description  = <<-DESC
  TODO: OC的多代理功能,代码量少,多线程调用代理也没问题
                   DESC

  spec.homepage     = "https://github.com/lanyannoren/OCMultiDelegate"

  spec.license      = "MIT"

  spec.author       = { "lanyannoren" => "dongyajing@yeejay.com" }
  
  spec.source       = { :git => "https://github.com/lanyannoren/OCMultiDelegate.git", :tag => spec.version }

  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true
  spec.source_files  = "MultiDelegate/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


end
