# frozen_string_literal: true

FactoryBot.define do
  factory :team_profile do
    team

    x_url { [true, false].sample ? Faker::Internet.url(scheme: 'https', host: 'twitter.com') : nil }
    instagram_url { [true, false].sample ? Faker::Internet.url(scheme: 'https', host: 'instagram.com') : nil }
    homepage_url { [true, false].sample ? Faker::Internet.url(scheme: 'https', host: 'example.com') : nil }
  end
end
