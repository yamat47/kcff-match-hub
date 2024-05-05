# frozen_string_literal: true

class Season < ApplicationRecord
  include UniversalId

  setup_universal_id('ssn')

  validates :full_name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true
end
