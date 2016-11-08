
Gem::Specification.new do |spec|
  spec.name          = "embulk-filter-flat_delimiter"
  spec.version       = "0.1.0"
  spec.authors       = ["hnmx4"]
  spec.summary       = "Flat Delimiter filter plugin for Embulk"
  spec.description   = "Flat Delimiter"
  spec.email         = ["haneuma0628@gmail.com"]
  spec.licenses      = ["MIT"]
  # TODO set this: spec.homepage      = "https://github.com/haneuma0628/embulk-filter-flat_delimiter"

  spec.files         = `git ls-files`.split("\n") + Dir["classpath/*.jar"]
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency 'YOUR_GEM_DEPENDENCY', ['~> YOUR_GEM_DEPENDENCY_VERSION']
  spec.add_development_dependency 'embulk', ['>= 0.8.13']
  spec.add_development_dependency 'bundler', ['>= 1.10.6']
  spec.add_development_dependency 'rake', ['>= 10.0']
end
