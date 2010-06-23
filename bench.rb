require "rubygems"
require "rbench"
require File.expand_path('../lib/unidecoder', __FILE__)

SAMPLE = "Ja, żołnierz Wojska Polskiego, przysięgam służyć wiernie Rzeczypospolitej Polskiej"
p SAMPLE.to_ascii

RBench.run(10_000) do

  column :times
  column :default

  report 'to_ascii' do
    default { SAMPLE.to_ascii }
  end

end
