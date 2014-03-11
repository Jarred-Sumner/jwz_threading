# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwz_threading/version'

Gem::Specification.new do |spec|
  spec.name          = "jwz_threading"
  spec.version       = JwzThreading::VERSION
  spec.authors = ["Frederik Dietz"]
  spec.date = %q{2009-06-07}
  spec.ecescription = %q{It is a small ruby library which lets you order a list of E-Mails by conversation. That is, grouping messages together in parent/child relationships based on which  messages are replies to which others.}
  spec.email = %q{fdietz@gmail.com}
  spec.homepage = %q{http://github.com/fdietz/jwz_threading}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end