

Pod::Spec.new do |s|  

  s.name         = "Crypter"
  s.version      = "0.0.1"
  s.summary      = "Reversable, custom key string encryption"
  s.license      = {
    :type => 'Free',
    :text => <<-LICENSE
              All contribution and reuse is welcome
              LICENSE
  }
  s.homepage     = "https://github.com/selim1377/Crypter"
  s.author       = { "Selim Bakdemir" => "selim.bakdemir@gmail.com" }
  s.platform     = :ios, '5.0'
  s.source       = { 
      :git => "https://github.com/selim1377/Crypter.git", 
      :tag => '0.0.1'
  }
  s.source_files  =  '*.{h,m}'
end
