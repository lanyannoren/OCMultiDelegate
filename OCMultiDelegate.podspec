Pod::Spec.new do |spec|

#pod库的名字,例如:MJRefresh,可用pod search 搜索到
  spec.name         = "OCMultiDelegate"

  #pod库的版本, 默认版本
  spec.version      = "0.0.1"

  #概要 会在pod search时展示
  spec.summary      = "OC多代理"


  spec.description  = <<-DESC
  TODO: OC的多代理功能,代码量少,多线程调用代理也没问题
                   DESC
  #库的主页,用来说明这个库
  spec.homepage     = "https://github.com/lanyannoren/OCMultiDelegate"

  spec.license      = "MIT"

  # 作者
  spec.author       = { "lanyannoren" => "acetom9090@163.com" }
  
  spec.source       = { :git => "https://github.com/lanyannoren/OCMultiDelegate.git", :tag => spec.version }

  #平台支持的最小版本
  spec.ios.deployment_target = '8.0'
  spec.requires_arc = true
  spec.source_files  = "MultiDelegate/**/*.{h,m}"

  #依赖库
  # spec.dependency 'MBProgressHUD', '~>0.5'

  # 需要添加的系统库
  # spec.ios.framework = 'SystemConfiguration'
  # spec.frameworks = 'QuartzCore', 'CoreData'

  # 需要连接的lib
  # spec.libraries = 'lstdc++', 'libz'

end

# 创建spec文件
# pod sepc create specName
# 会生成 specName.podspec 的文件
# 注意事项: 1.spec文件要在仓库的根目录下, 2.提交spec的库文件也要在仓库根目录下

