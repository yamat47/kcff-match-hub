# frozen_string_literal: true

class Notice < ApplicationRecord
  include UniversalId

  setup_universal_id('adm')

  validates :title, presence: true
  validates :content, presence: true
end
