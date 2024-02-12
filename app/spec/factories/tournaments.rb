# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    name { Faker::Sports::Football.competition }
  end
end
