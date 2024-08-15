$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'net/smtp/ntlm/version'

Gem::Specification.new do |spec|
  spec.name          = 'net-smtp-ntlm'
  spec.version       = Net::SMTP::NTLM::VERSION
  spec.summary       = 'Add-on for net-smtp gem to add NTLM support.'
  spec.description   = 'Add-on for net-smtp gem to add NTLM support.'

  spec.authors       = ['Fedosov Sergey (RnD Soft)']
  spec.email         = 'info@rnds.pro'
  spec.homepage      = 'https://rnds.pro'

  spec.add_runtime_dependency 'net-smtp', '~> 0.4.0'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"

  spec.files         = %w[README.md CHANGELOG.md net-smtp-ntlm.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = ['lib']
end
