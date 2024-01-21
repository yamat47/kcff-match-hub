# frozen_string_literal: true

require 'haml_lint/rake_task'

desc 'Run haml-lint'
HamlLint::RakeTask.new(:haml_lint) do |task|
  task.files = ['app/views']
end
