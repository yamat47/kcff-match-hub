# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    sequence(:name) { |n| "Tournament #{n}" }
  end
end
