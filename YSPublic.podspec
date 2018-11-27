Pod::Spec.new do |s|

s.name         = "YSPublic"
s.version      = "0.0.2"
s.summary      = "公共部分、组件"
s.description  = <<-DESC
原上科技所有项目的公共部分
实用组件
DESC
s.homepage     = "https://github.com/rocky-ren/YSPublic"
s.license      = "MIT"
s.author             = { "rocky-ren" => "email@address.com" }
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/rocky-ren/YSPublic.git", :tag => "v#{s.version}" }
s.source_files  = "YSPublic", "**/*.*"
#s.source_files  = "YSPublic", "YSPublic/YSCache/*.*"
#s.source_files  = "YSPublic", "YSPublic/YSCate/*.*"
#s.source_files  = "YSPublic", "YSPublic/YSComponents/*.*"
#s.source_files  = "YSPublic", "YSHint/*.*"
s.frameworks = 'UIKit', 'QuartzCore', 'Foundation', 'CoreText'
s.requires_arc = true

s.dependency 'AFNetworking','~> 3.1.0'
s.dependency 'FMDB','~> 2.7.2'
s.dependency 'MJExtension'
s.dependency 'MBProgressHUD'
s.dependency 'SVProgressHUD'
s.dependency 'Masonry'
s.dependency 'ReactiveObjC'
s.dependency 'UICollectionViewLeftAlignedLayout'
s.dependency 'KVOController'
s.dependency 'SDWebImageCache'
s.dependency 'SDWebImage'
s.dependency 'MJRefresh'
s.dependency 'YLGIFImage'


end

