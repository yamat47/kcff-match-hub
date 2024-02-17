# frozen_string_literal: true

class Team < ApplicationRecord
  include UniversalId

  setup_universal_id('tem')
end
