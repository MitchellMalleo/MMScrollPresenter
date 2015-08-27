Pod::Spec.new do |s|
  s.name             = "MMScrollPresenter"
  s.version          = "0.0.3"
  s.summary          = "iOS Custom UIScrollView Control for paging UIViews"
  s.homepage         = "https://github.com/MitchellMalleo/MMScrollPresenter"
  s.license          = 'MIT'
  s.author           = { "Mitch Malleo" => "mitchellmalleo@gmail.com" }
  s.source           = { :git => "https://github.com/MitchellMalleo/MMScrollPresenter.git", :tag => s.version.to_s }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.resources = "Assets/*"
end

