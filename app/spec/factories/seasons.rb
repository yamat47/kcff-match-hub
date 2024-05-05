# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    short_name { Random.rand(1950..3000) }
    full_name { "#{short_name}年度" }
  end
end
