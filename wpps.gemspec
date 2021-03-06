lib = File.expand_path("../lib/", __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require 'whiplash/version'

Gem::Specification.new do |s|
  s.name               = 'wpps'
  s.version            = Whiplash::VERSION
  s.date               = '2016-12-02'
  s.summary            = 'The whip hand'
  s.description        = "Share code snippets by mean of twitter and pastie"
  s.author             = "Juan Francisco Cardona McCormick"
  s.email              = ['jfcmacro@gmail.com', 'fcardona@eafit.edu.co']
  s.homepage           = 'https://github.com/jfcmacro/whiplash'
  s.files              = ["lib/extensions.rb",
                          "lib/wputils.rb",
                          "lib/initcommand.rb",
                          "lib/whiplash/version.rb"
                         ]
  s.license            = 'AFL-2.0'
  s.add_dependency('twitter', '~> 5.16.0', '>= 5.16.0')
  s.add_dependency('pastie-api', '~> 0.2.1', '>= 0.2.1')
  s.add_dependency('faraday', '~> 0.9.2', '>= 0.9.2')
  s.add_dependency('faraday_middleware', '~> 0.10.0', '>= 0.10.0')
  s.add_dependency('nokogiri', '~> 1.6.8.1', '>= 1.6.8.1')
  s.executables        << 'wp'
  s.executables        << "pwrslv"
end
