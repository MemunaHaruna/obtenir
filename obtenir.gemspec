# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "obtenir/version"

Gem::Specification.new do |spec|
  spec.name          = "obtenir"
  spec.version       = Obtenir::VERSION
  spec.authors       = ["memuna haruna"]
  spec.email         = ["memuna.haruna@andela.com"]

  spec.summary       = "Simple github api consumer"
  spec.description   = "query github api with their username and save response to file or database"
  spec.homepage      = "https://github.com/MemunaHaruna/obtenir"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "colorize"
  spec.add_dependency "httparty"
  spec.add_dependency "mongo", "~> 2.2"
  spec.add_dependency "bson_ext"
end
