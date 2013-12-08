require File.dirname(__FILE__) + '/lib/yard'
require File.dirname(__FILE__) + '/lib/yard/rubygems/specification'
require 'rbconfig'

YARD::VERSION.replace(ENV['YARD_VERSION']) if ENV['YARD_VERSION']

task :default => :specs

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "deg-yard"
  gem.homepage = "http://github.com/DavidEGrayson/yard"
  gem.license = "MIT"
  gem.summary = "DavidEGrayson's fork of the YARD gem with unicode support."
  gem.description = "The real YARD gem is maintained by Loren Segal. This is a fork made by DavidEGrayson to fix some things that were bothering him."
  gem.email = "davidegrayson@gmail.com"
  gem.authors = ["David Grayson", "Loren Segal"]
  gem.version = YARD::VERSION
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

begin
require 'rvm-tester'
RVM::Tester::TesterTask.new do |t|
  t.rubies = %w(1.8.6 ree jruby 1.8.7 1.9.2 1.9.3)
  t.bundle_install = false # don't need to do this all the time
  t.verbose = true
end
rescue LoadError
end

task :travis_ci do
  ENV['SUITE'] = '1'
  ENV['CI'] = '1'
  ENV['LEGACY'] = nil
  Rake::Task['specs'].execute
  if RUBY_VERSION >= '1.9' && RUBY_PLATFORM != 'java'
    puts ""
    puts "Running specs with in legacy mode"
    ENV['LEGACY'] = '1'
    Rake::Task['specs'].execute
  end
end

desc "Run all specs"
task :specs do
  opts = ['rspec', '-c']
  opts += ["--require", File.join(File.dirname(__FILE__), 'spec', 'spec_helper')]
  opts += ['-I', YARD::ROOT]
  if ENV['DEBUG']
    $DEBUG = true
    opts += ['-d']
  end
  if ENV['SPEC']
    opts += ENV['SPEC'].split(' ')
  else
    opts += FileList["spec/**/*_spec.rb"].sort
  end
  cmd = opts.join(' ')
  puts cmd if Rake.application.options.trace
  system(cmd)
  raise "Command failed with status (#{$?.to_i}): #{cmd}" if $?.to_i != 0
end
task :spec => :specs

YARD::Rake::YardocTask.new do |t|
  t.options += ['--title', "YARD #{YARD::VERSION} Documentation"]
end
