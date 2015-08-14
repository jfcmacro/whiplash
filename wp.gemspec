Gem::Specification.new do |s|
  s.name               = 'wp'
  s.version            = '0.1.1'
  s.date               = '2015-08-14'
  s.summary            = 'The whip hand'
  s.description        = 'Share snippets of code with a group of persons by twitter'
  s.author             = "Juan Francisco Cardona McCormick"
  s.email              = 'fcardona@gmail.com'
  s.homepage           = 'https://github.com/jfcmacro/whiplash'
  s.files              = ["lib/extensions.rb"]
  s.license            = 'ARTISTIC'
  s.add_dependency('twitter', '~> 5.14.0', '>= 5.14.0')
  s.add_dependency('pastie-api', '~> 0.2.1', '>= 0.2.1')
  s.executables        << 'wp'
end
