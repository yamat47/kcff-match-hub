# frozen_string_literal: true

module Admin
  class MediaPageSettingsController < ApplicationController
    def show
      @media_hero_images = MediaHeroImage.sort_order_ordered
    end
  end
end
