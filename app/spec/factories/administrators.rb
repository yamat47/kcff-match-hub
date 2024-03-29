# frozen_string_literal: true

FactoryBot.define do
  factory :administrator do
    email { Faker::Internet.email }
    universal_id { "adm_#{SecureRandom.alphanumeric(8)}" }
  end
end
