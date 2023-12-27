# frozen_string_literal: true

class Administrator < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
