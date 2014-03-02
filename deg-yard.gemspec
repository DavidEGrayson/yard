require File.expand_path('../lib/yard/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "deg-yard"
  s.summary       = "DavidEGrayson's fork of the YARD gem which has some extra bug fixes."
  s.description   = "The real YARD gem is maintained by Loren Segal. This is a fork made by DavidEGrayson to fix some things that were bothering him."
  s.version       = YARD::VERSION
  s.date          = Time.now.strftime('%Y-%m-%d')
  s.authors       = ["David Grayson", "Loren Segal"]
  s.email         = "davidegrayson@gmail.com"
  s.homepage      = "http://github.com/DavidEGrayson/yard"
  s.platform      = Gem::Platform::RUBY
  s.files         = Dir.glob("{docs,bin,lib,spec,templates,benchmarks}/**/*") +
    ['LICENSE', 'LEGAL', 'README.md', 'Rakefile', '.yardopts', __FILE__]
  s.require_paths = ['lib']
  s.executables   = ['yard', 'yardoc', 'yri']
  s.has_rdoc      = 'yard'
  s.rubyforge_project = 'yard'
  s.license = 'MIT' if s.respond_to?(:license=)
end