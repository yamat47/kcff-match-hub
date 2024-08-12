# frozen_string_literal: true

module Media
  class HomesController < ApplicationController
    NOTICES_LIMIT = 3

    def show
      @media_hero_images = MediaHeroImage.sort_order_ordered

      @notices = Notice.only_published
                       .published_at_ordered
                       .limit(NOTICES_LIMIT)

      @game_schedules = GameSchedule.next_scheduled_games
    end
  end
end
