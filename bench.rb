# encoding: utf-8
require "rubygems"
require "rbench"
require File.expand_path('../lib/unidecoder', __FILE__)

SAMPLE = "Ja, żołnierz Wojska Polskiego, przysięgam służyć wiernie Rzeczypospolitej Polskiej"

RBench.run(10_000) do

  column :times
  column :default

  report 'to_ascii' do
    default { SAMPLE.to_ascii }
  end

end
