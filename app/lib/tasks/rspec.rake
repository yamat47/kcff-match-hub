# frozen_string_literal: true

# rspec is only for local development.
# It is not necessary to run rspec in production.
return if Rails.env.production?

require 'rspec/core/rake_task'

desc 'Run RSpec tests'
RSpec::Core::RakeTask.new(:spec)
