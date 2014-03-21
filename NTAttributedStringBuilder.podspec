Pod::Spec.new do |s|
  s.name         = "NTAttributedStringBuilder"
  s.version      = "0.10"
  s.summary      = "A fast, flexible and easy to use tool for building attributed strings."
  s.homepage     = "https://github.com/NagelTech/NTAttributedStringBuilder"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Ethan Nagel" => "eanagel@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/NagelTech/NTAttributedStringBuilder.git", :tag => "0.10" }
  s.requires_arc = true
  s.source_files = '*.{h,m}'
end
