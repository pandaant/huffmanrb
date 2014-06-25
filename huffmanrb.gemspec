$:.push File.expand_path("../lib", __FILE__)
require 'huffmanrb/version'

Gem::Specification.new do |s|
    s.name        = 'huffmanrb'
    s.version     = Huffmanrb::VERSION 
    s.date        = '2014-06-25'
    s.summary     = "Huffman encoder/decoder"
    s.description = "Huffman encoder/decoder"
    s.authors     = ["Mark"]
    s.email       = 'apandaant@gmail.com'
    s.files       = Dir.glob("{lib,bin}/**/*")
    s.executables = %w[huffrb-encode huffrb-decode]
    s.license     = 'MIT'

    s.add_development_dependency "rake"
end
