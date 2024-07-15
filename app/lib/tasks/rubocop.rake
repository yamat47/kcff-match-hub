# frozen_string_literal: true

# rubocop is only for local development.
# It is not necessary to run rubocop in production.
return if Rails.env.production?

require 'rubocop/rake_task'

desc 'Run RuboCop'
RuboCop::RakeTask.new(:rubocop)
