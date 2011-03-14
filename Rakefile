require 'rubygems'
require 'rake/gempackagetask'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.name             = 'capistrano_multiple_deployment_strategy'
  s.version          = '1.0.0'
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "A deployment strategy for Capistrano 2.0 that allows multiple deployment strategies to be specified on a per-role basis"
  s.authors          = ['Roger Nesbitt']
  s.email            = 'roger@youdo.co.nz'
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("lib/**/*")

  s.add_dependency('capistrano', '>=2.1.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
