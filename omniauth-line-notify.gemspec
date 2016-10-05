# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/line/notify/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-line-notify"
  spec.version       = Omniauth::Line::Notify::VERSION
  spec.authors       = ["blueplanet"]
  spec.email         = ["erguolinge@gmail.com"]
  spec.summary       = %q{OmniAuth strategy for LineNotify}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com//blueplanet/omniauth-line-notify'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development 'json'
  spec.add_development 'omniauth-oauth2'
  spec.add_development_dependency "bundler", "~> 1.11"
end
