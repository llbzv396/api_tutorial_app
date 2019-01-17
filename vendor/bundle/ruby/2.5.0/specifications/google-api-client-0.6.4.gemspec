# -*- encoding: utf-8 -*-
# stub: google-api-client 0.6.4 ruby lib

Gem::Specification.new do |s|
  s.name = "google-api-client".freeze
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bob Aman".freeze, "Steve Bazyl".freeze]
  s.date = "2013-06-03"
  s.description = "The Google API Ruby Client makes it trivial to discover and access supported\nAPIs.\n".freeze
  s.email = "sbazyl@google.com".freeze
  s.executables = ["google-api".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze, "bin/google-api".freeze]
  s.homepage = "http://code.google.com/p/google-api-ruby-client/".freeze
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Package Summary".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<signet>.freeze, ["~> 0.4.5"])
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 2.3.2"])
      s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 2.1.0"])
      s.add_runtime_dependency(%q<autoparse>.freeze, [">= 0.3.3"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.8.4"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<extlib>.freeze, [">= 0.9.15"])
      s.add_runtime_dependency(%q<jwt>.freeze, [">= 0.1.5"])
      s.add_runtime_dependency(%q<launchy>.freeze, [">= 2.1.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.11.0"])
    else
      s.add_dependency(%q<signet>.freeze, ["~> 0.4.5"])
      s.add_dependency(%q<addressable>.freeze, [">= 2.3.2"])
      s.add_dependency(%q<uuidtools>.freeze, [">= 2.1.0"])
      s.add_dependency(%q<autoparse>.freeze, [">= 0.3.3"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.8.4"])
      s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<extlib>.freeze, [">= 0.9.15"])
      s.add_dependency(%q<jwt>.freeze, [">= 0.1.5"])
      s.add_dependency(%q<launchy>.freeze, [">= 2.1.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.11.0"])
    end
  else
    s.add_dependency(%q<signet>.freeze, ["~> 0.4.5"])
    s.add_dependency(%q<addressable>.freeze, [">= 2.3.2"])
    s.add_dependency(%q<uuidtools>.freeze, [">= 2.1.0"])
    s.add_dependency(%q<autoparse>.freeze, [">= 0.3.3"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.8.4"])
    s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<extlib>.freeze, [">= 0.9.15"])
    s.add_dependency(%q<jwt>.freeze, [">= 0.1.5"])
    s.add_dependency(%q<launchy>.freeze, [">= 2.1.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.11.0"])
  end
end
