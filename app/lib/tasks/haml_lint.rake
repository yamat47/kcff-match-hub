# frozen_string_literal: true

# haml-lint is only for local development.
# It is not necessary to run haml-lint in production.
return if Rails.env.production?

require 'haml_lint/rake_task'

desc 'Run haml-lint'
HamlLint::RakeTask.new(:haml_lint) do |task|
  task.files = ['app/views']
end
