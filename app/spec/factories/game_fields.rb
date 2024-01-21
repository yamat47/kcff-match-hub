# frozen_string_literal: true

FactoryBot.define do
  factory :game_field do
    universal_id { "gmf_#{SecureRandom.alphanumeric(8)}" }
    name { "#{Faker::Address.city}#{%w[グラウンド フィールド].sample}" }
    address { Faker::Address.full_address }
    google_maps_url { Faker::Internet.url(host: 'maps.app.goo.gl') }
  end
end
