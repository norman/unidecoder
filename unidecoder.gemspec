# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{unidecoder}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lucky Sneaks"]
  s.date = %q{2009-02-20}
  s.description = %q{A port of Perl's Unidecoder to Ruby. Reliably converts Unicode strings to ASCII equivalents.}
  s.email = %q{rsl@luckysneaks.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "README.rdoc", "Rakefile", "init.rb", "lib/unidecoder.rb", "lib/unidecoder_data/x00.yml", "lib/unidecoder_data/x01.yml", "lib/unidecoder_data/x02.yml", "lib/unidecoder_data/x03.yml", "lib/unidecoder_data/x04.yml", "lib/unidecoder_data/x05.yml", "lib/unidecoder_data/x06.yml", "lib/unidecoder_data/x07.yml", "lib/unidecoder_data/x09.yml", "lib/unidecoder_data/x0a.yml", "lib/unidecoder_data/x0b.yml", "lib/unidecoder_data/x0c.yml", "lib/unidecoder_data/x0d.yml", "lib/unidecoder_data/x0e.yml", "lib/unidecoder_data/x0f.yml", "lib/unidecoder_data/x10.yml", "lib/unidecoder_data/x11.yml", "lib/unidecoder_data/x12.yml", "lib/unidecoder_data/x13.yml", "lib/unidecoder_data/x14.yml", "lib/unidecoder_data/x15.yml", "lib/unidecoder_data/x16.yml", "lib/unidecoder_data/x17.yml", "lib/unidecoder_data/x18.yml", "lib/unidecoder_data/x1e.yml", "lib/unidecoder_data/x1f.yml", "lib/unidecoder_data/x20.yml", "lib/unidecoder_data/x21.yml", "lib/unidecoder_data/x22.yml", "lib/unidecoder_data/x23.yml", "lib/unidecoder_data/x24.yml", "lib/unidecoder_data/x25.yml", "lib/unidecoder_data/x26.yml", "lib/unidecoder_data/x27.yml", "lib/unidecoder_data/x28.yml", "lib/unidecoder_data/x2e.yml", "lib/unidecoder_data/x2f.yml", "lib/unidecoder_data/x30.yml", "lib/unidecoder_data/x31.yml", "lib/unidecoder_data/x32.yml", "lib/unidecoder_data/x33.yml", "lib/unidecoder_data/x4d.yml", "lib/unidecoder_data/x4e.yml", "lib/unidecoder_data/x4f.yml", "lib/unidecoder_data/x50.yml", "lib/unidecoder_data/x51.yml", "lib/unidecoder_data/x52.yml", "lib/unidecoder_data/x53.yml", "lib/unidecoder_data/x54.yml", "lib/unidecoder_data/x55.yml", "lib/unidecoder_data/x56.yml", "lib/unidecoder_data/x57.yml", "lib/unidecoder_data/x58.yml", "lib/unidecoder_data/x59.yml", "lib/unidecoder_data/x5a.yml", "lib/unidecoder_data/x5b.yml", "lib/unidecoder_data/x5c.yml", "lib/unidecoder_data/x5d.yml", "lib/unidecoder_data/x5e.yml", "lib/unidecoder_data/x5f.yml", "lib/unidecoder_data/x60.yml", "lib/unidecoder_data/x61.yml", "lib/unidecoder_data/x62.yml", "lib/unidecoder_data/x63.yml", "lib/unidecoder_data/x64.yml", "lib/unidecoder_data/x65.yml", "lib/unidecoder_data/x66.yml", "lib/unidecoder_data/x67.yml", "lib/unidecoder_data/x68.yml", "lib/unidecoder_data/x69.yml", "lib/unidecoder_data/x6a.yml", "lib/unidecoder_data/x6b.yml", "lib/unidecoder_data/x6c.yml", "lib/unidecoder_data/x6d.yml", "lib/unidecoder_data/x6e.yml", "lib/unidecoder_data/x6f.yml", "lib/unidecoder_data/x70.yml", "lib/unidecoder_data/x71.yml", "lib/unidecoder_data/x72.yml", "lib/unidecoder_data/x73.yml", "lib/unidecoder_data/x74.yml", "lib/unidecoder_data/x75.yml", "lib/unidecoder_data/x76.yml", "lib/unidecoder_data/x77.yml", "lib/unidecoder_data/x78.yml", "lib/unidecoder_data/x79.yml", "lib/unidecoder_data/x7a.yml", "lib/unidecoder_data/x7b.yml", "lib/unidecoder_data/x7c.yml", "lib/unidecoder_data/x7d.yml", "lib/unidecoder_data/x7e.yml", "lib/unidecoder_data/x7f.yml", "lib/unidecoder_data/x80.yml", "lib/unidecoder_data/x81.yml", "lib/unidecoder_data/x82.yml", "lib/unidecoder_data/x83.yml", "lib/unidecoder_data/x84.yml", "lib/unidecoder_data/x85.yml", "lib/unidecoder_data/x86.yml", "lib/unidecoder_data/x87.yml", "lib/unidecoder_data/x88.yml", "lib/unidecoder_data/x89.yml", "lib/unidecoder_data/x8a.yml", "lib/unidecoder_data/x8b.yml", "lib/unidecoder_data/x8c.yml", "lib/unidecoder_data/x8d.yml", "lib/unidecoder_data/x8e.yml", "lib/unidecoder_data/x8f.yml", "lib/unidecoder_data/x90.yml", "lib/unidecoder_data/x91.yml", "lib/unidecoder_data/x92.yml", "lib/unidecoder_data/x93.yml", "lib/unidecoder_data/x94.yml", "lib/unidecoder_data/x95.yml", "lib/unidecoder_data/x96.yml", "lib/unidecoder_data/x97.yml", "lib/unidecoder_data/x98.yml", "lib/unidecoder_data/x99.yml", "lib/unidecoder_data/x9a.yml", "lib/unidecoder_data/x9b.yml", "lib/unidecoder_data/x9c.yml", "lib/unidecoder_data/x9d.yml", "lib/unidecoder_data/x9e.yml", "lib/unidecoder_data/x9f.yml", "lib/unidecoder_data/xa0.yml", "lib/unidecoder_data/xa1.yml", "lib/unidecoder_data/xa2.yml", "lib/unidecoder_data/xa3.yml", "lib/unidecoder_data/xa4.yml", "lib/unidecoder_data/xac.yml", "lib/unidecoder_data/xad.yml", "lib/unidecoder_data/xae.yml", "lib/unidecoder_data/xaf.yml", "lib/unidecoder_data/xb0.yml", "lib/unidecoder_data/xb1.yml", "lib/unidecoder_data/xb2.yml", "lib/unidecoder_data/xb3.yml", "lib/unidecoder_data/xb4.yml", "lib/unidecoder_data/xb5.yml", "lib/unidecoder_data/xb6.yml", "lib/unidecoder_data/xb7.yml", "lib/unidecoder_data/xb8.yml", "lib/unidecoder_data/xb9.yml", "lib/unidecoder_data/xba.yml", "lib/unidecoder_data/xbb.yml", "lib/unidecoder_data/xbc.yml", "lib/unidecoder_data/xbd.yml", "lib/unidecoder_data/xbe.yml", "lib/unidecoder_data/xbf.yml", "lib/unidecoder_data/xc0.yml", "lib/unidecoder_data/xc1.yml", "lib/unidecoder_data/xc2.yml", "lib/unidecoder_data/xc3.yml", "lib/unidecoder_data/xc4.yml", "lib/unidecoder_data/xc5.yml", "lib/unidecoder_data/xc6.yml", "lib/unidecoder_data/xc7.yml", "lib/unidecoder_data/xc8.yml", "lib/unidecoder_data/xc9.yml", "lib/unidecoder_data/xca.yml", "lib/unidecoder_data/xcb.yml", "lib/unidecoder_data/xcc.yml", "lib/unidecoder_data/xcd.yml", "lib/unidecoder_data/xce.yml", "lib/unidecoder_data/xcf.yml", "lib/unidecoder_data/xd0.yml", "lib/unidecoder_data/xd1.yml", "lib/unidecoder_data/xd2.yml", "lib/unidecoder_data/xd3.yml", "lib/unidecoder_data/xd4.yml", "lib/unidecoder_data/xd5.yml", "lib/unidecoder_data/xd6.yml", "lib/unidecoder_data/xd7.yml", "lib/unidecoder_data/xf9.yml", "lib/unidecoder_data/xfa.yml", "lib/unidecoder_data/xfb.yml", "lib/unidecoder_data/xfc.yml", "lib/unidecoder_data/xfd.yml", "lib/unidecoder_data/xfe.yml", "lib/unidecoder_data/xff.yml", "test/unicode_point_suite/basic_latin_test.rb", "test/unicode_point_suite/codepoint_test_helper.rb", "test/unidecoder_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://unidecoder.rubyforge.org/}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{unidecoder}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Reliably converts Unicode strings to ASCII equivalents.}
  s.test_files = ["test/unicode_point_suite/basic_latin_test.rb", "test/unidecoder_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
