# frozen_string_literal: true

require 'open-uri'

FactoryBot.define do
  factory :team do
    name { Faker::Sports::Football.team }

    after :build do |team|
      image = URI.parse('https://picsum.photos/500').open
      team.logo.attach(io: image, filename: 'team_logo.jpg', content_type: 'image/jpg')
    end
  end
end
