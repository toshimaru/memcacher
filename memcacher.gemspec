# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "memcacher/version"

Gem::Specification.new do |spec|
  spec.name          = "memcacher"
  spec.version       = Memcacher::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Better memcache integration for Rails.}
  spec.description   = %q{Better memcache integration for Rails.}
  spec.homepage      = "https://github.com/toshimaru/memcacher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.2.2"

  spec.add_dependency "dalli", "~> 2.7"
  spec.add_dependency "rails", "~> 5.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rubocop-rails"
end
