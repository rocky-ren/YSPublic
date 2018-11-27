Pod::Spec.new do |s|

s.name         = "YSPublic"
s.version      = "0.0.1"
s.summary      = "公共部分、组件"
s.description  = <<-DESC
原上科技所有项目的公共部分
实用组件
DESC
s.homepage     = "https://github.com/rocky-ren/YSPublic"
s.license      = "MIT"
s.author             = { "rocky-ren" => "838086117@qq.com" }
s.platform     = :ios, "6.0"
s.source       = { :git => "https://gitee.com/damengkeji_admin/YSPublic.git", :tag => "v#{s.version}" }




s.source_files  = "YSPublic", "**.h"


s.subspec 'YSCache' do |ss|
ss.source_files = "YSPublic", "YSCache/**.*"
end

s.subspec 'YSCate' do |ss|
ss.source_files = "YSPublic", "YSCate/**.*"
end




s.subspec 'YSComponents' do |ss|

ss.subspec 'AlertView' do |sss|
sss.source_files = "YSPublic", "YSComponents/AlertView/**.*"
end

ss.subspec 'RichText' do |sss|
sss.source_files = "YSPublic", "YSComponents/RichText/**.*"
end

ss.subspec 'VCMenus' do |sss|
sss.source_files = "YSPublic", "YSComponents/VCMenus/**.*"
end

ss.subspec 'RPhotoBrowser' do |sss|
sss.source_files = "YSPublic", "YSComponents/RPhotoBrowser/**.*"
end

ss.subspec 'YSSplash' do |sss|
sss.source_files = "YSPublic", "YSComponents/YSSplash/**.*"
end




end


s.subspec 'YSHint' do |ss|
ss.source_files = "YSPublic", "YSHint/**.*"
end


s.frameworks = 'QuartzCore', 'Foundation', 'CoreText'
s.requires_arc = true

s.dependency 'AFNetworking'
s.dependency 'MJExtension'
s.dependency 'MBProgressHUD'
s.dependency 'SVProgressHUD'
s.dependency 'Masonry'
s.dependency 'ReactiveObjC'
s.dependency 'UICollectionViewLeftAlignedLayout'
s.dependency 'KVOController'
s.dependency 'MJRefresh'
s.dependency 'JFImagePicker'
s.dependency 'TZImagePickerController'
s.dependency 'FMDB'
s.dependency 'YLGIFImage'
s.dependency 'SDWebImage'

end

