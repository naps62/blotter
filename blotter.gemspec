require File.expand_path('../lib/blotter/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "blotter"
  s.version     = Blotter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Miguel Palhas"]
  s.email       = ["mpalhas@gmail.com"]
  s.homepage    = "https://github.com/naps62/blotter"
  s.summary     = "Statistics aggregator and analyser"
  s.description = "Someday i'll find something nice to say here"
  s.license     = "MIT"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
end
