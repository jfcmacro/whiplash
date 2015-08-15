Gem::Specification.new do |s|
  s.name               = 'wp'
  s.version            = '0.1.3'
  s.date               = '2015-08-15'
  s.summary            = 'The whip hand'
  s.description        = 'Share snippets of code with a group of persons by twitter'
  s.author             = "Juan Francisco Cardona McCormick"
  s.email              = 'jfcmacro@gmail.com'
  s.homepage           = 'https://github.com/jfcmacro/whiplash'
  s.files              = ["lib/extensions.rb", "lib/wputils.rb"]
  s.license            = 'ARTISTIC'
  s.add_dependency('twitter', '~> 5.14.0', '>= 5.14.0')
  s.add_dependency('pastie-api', '~> 0.2.1', '>= 0.2.1')
  s.add_dependency('faraday', '~> 0.9.1', '>= 0.9.1')
  s.add_dependency('faraday_middleware', '~> 0.10.0', '>= 0.10.0')
  s.add_dependency('nokogiri', '~> 1.5.2', '>= 1.5.2')
  s.executables        << 'wp'
  s.executables        << "pwrslv"
end
