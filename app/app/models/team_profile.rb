# frozen_string_literal: true

class TeamProfile < ApplicationRecord
  belongs_to :team

  validates :team, presence: true, uniqueness: true
  validates :x_url, url: { host: /\Atwitter\.com\Z/ }
  validates :instagram_url, url: { host: /\Ainstagram\.com\Z/ }
end
