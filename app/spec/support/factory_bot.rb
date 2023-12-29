# frozen_string_literal: true

# Setup FactoryBot syntax methods
# see: https://thoughtbot.github.io/factory_bot/setup/summary.html
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
