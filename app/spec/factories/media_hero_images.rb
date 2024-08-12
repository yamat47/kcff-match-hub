# frozen_string_literal: true

require 'open-uri'

FactoryBot.define do
  factory :media_hero_image do
    sequence(:sort_order) { |n| n }

    after :build do |media_hero_image|
      image = URI.parse('https://picsum.photos/600/200').open
      media_hero_image.image.attach(io: image, filename: "media_hero_image_#{media_hero_image.sort_order}.jpg", content_type: 'image/jpg')
    end
  end
end
