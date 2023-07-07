# -*- encoding: utf-8 -*-
# stub: payjp 0.0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "payjp".freeze
  s.version = "0.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "https://github.com/payjp/payjp-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["PAY.JP".freeze]
  s.date = "2022-09-30"
  s.description = "PAY.JP makes it way easier and less expensive to accept payments.".freeze
  s.email = ["support@pay.jp".freeze]
  s.homepage = "https://pay.jp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Ruby bindings for the Payjp API".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<mocha>.freeze, ["~> 1.2.1"])
  s.add_development_dependency(%q<activesupport>.freeze, ["< 5.0", "~> 4.2.7"])
  s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.2.2"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 11.3.0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.7.6"])
end
