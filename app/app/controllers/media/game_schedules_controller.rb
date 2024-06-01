# frozen_string_literal: true

module Media
  class GameSchedulesController < ApplicationController
    def index
      # FIXME: filter by season.
      # FIXME: order by game_field.
      game_schedules = GameSchedule.start_at_ordered
                                   .preload(:home_team, :visitor_team, :game_field, :tournament)

      # group by date.
      @game_schedule_groups = game_schedules.group_by { |game_schedule| game_schedule.start_at.to_date }
    end
  end
end
