Gem::Specification.new do |s|
  s.name = %q{i18n_link}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes Barre"]
  s.date = %q{2011-07-12}
  s.email = %q{igel@igels.net}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "MIT-LICENSE",
    "README.textile",
    "lib/i18n_link.rb",
    "lib/i18n_link/helper.rb",
    "spec/i18n_link_helper_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/igel/i18n_link}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Deprecated helper for links in your translations. Consider to use 'it' instead}
  s.test_files = [
    "spec/i18n_link_helper_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.add_development_dependency('actionpack', '~> 3.0.0')
  s.add_development_dependency('rspec', '~> 2.6.0')
end