# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'example_group_timer/version'

Gem::Specification.new do |gem|
  gem.name          = 'example_group_timer'
  gem.version       = ExampleGroupTimer::VERSION
  gem.authors       = ['Arjan van der Gaag']
  gem.email         = ['arjan@arjanvandergaag.nl']
  gem.description   = %q{RSpec formatter to measure run times of individual example groups}
  gem.summary       = <<-EOS
Report the time it takes to run each example group in your spec suite, and what
share of its parent group runtime it represents. Useful for finding where to
optimize your spec suite first.
EOS
  gem.homepage      = 'https://github.com/avdgaag/example_group_timer'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_dependency 'rspec'
end
