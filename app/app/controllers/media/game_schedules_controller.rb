# frozen_string_literal: true

module Media
  class GameSchedulesController < ApplicationController
    before_action :ensure_season_param

    def index
      season = Season.find_by!(short_name: params[:season])

      # FIXME: order by game_field.
      game_schedules = GameSchedule.start_at_ordered
                                   .where(season: season)
                                   .preload(:home_team, :visitor_team, :game_field, :tournament)

      # group by date.
      @game_schedule_groups = game_schedules.group_by { |game_schedule| game_schedule.start_at.to_date }
    end

    private

    def ensure_season_param
      return if params[:season].present?

      latest_season_param = Season.latest.short_name

      redirect_to season_game_schedules_path(season: latest_season_param)
    end
  end
end
