require 'newgem'
require 'lib/unidecoder'

$hoe = Hoe.new("unidecoder", Unidecoder::Version::STRING) do |p|
  p.rubyforge_name = "unidecoder"
  p.author = 'Lucky Sneaks'
  p.email = 'rsl@luckysneaks.com'
  p.summary = "Reliably converts Unicode strings to ASCII equivalents."
  p.description = "A port of Perl's Unidecoder to Ruby. Reliably converts Unicode strings to ASCII equivalents."
  p.url = 'http://unidecoder.rubyforge.org/'
  p.test_globs = ['test/**/*_test.rb']
  p.extra_dev_deps << ['newgem', ">= #{::Newgem::VERSION}"]
end

require 'newgem/tasks'
