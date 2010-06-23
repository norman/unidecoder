require File.expand_path("../lib/unidecoder/version", __FILE__)

spec = Gem::Specification.new do |s|
  s.name           = "unidecoder"
  s.authors         = ['Russell Norris', 'Norman Clarke']
  s.email          = ['rsl@luckysneaks.com', 'norman@njclarke.com']
  s.summary        = "Transliterates Unicode strings to an ASCII approximation."
  s.description    = "A port of Perl's Unidecoder to Ruby. Transliterates Unicode strings to an ASCII approximation."
  s.homepage       = 'http://github.com/norman/unidecoder'
  s.version        = Unidecoder::Version::STRING
  s.test_files     = Dir.glob "test/**/*_test.rb"
  s.files          = Dir["lib/**/*.rb", "lib/**/*.rake", "*.md", "LICENSE", "Rakefile", "test/**/*.*", "lib/**/*.yml"]
  s.rubyforge_project = "[none]"
end
