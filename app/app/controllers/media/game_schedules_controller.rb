# frozen_string_literal: true

module Media
  class GameSchedulesController < ApplicationController
    SEASONS_LIMIT = 8

    before_action :ensure_season_param

    def index
      season = Season.find_by!(short_name: params[:season])

      game_schedules = GameSchedule.start_at_ordered
                                   .game_field_ordered
                                   .where(season:)
                                   .preload(:home_team, :visitor_team, :game_field, :tournament)

      # group by date.
      @game_schedule_groups = game_schedules.group_by { |game_schedule| game_schedule.start_at.to_date }

      @seasons = Season.game_schedule_associated
                       .order_by_full_name_desc
                       .distinct
                       .limit(SEASONS_LIMIT)
    end

    private

    def ensure_season_param
      return if params[:season].present?

      latest_season = Season.game_schedule_associated
                            .latest

      raise ActiveRecord::RecordNotFound if latest_season.blank?

      latest_season_param = latest_season.short_name

      redirect_to season_game_schedules_path(season: latest_season_param)
    end
  end
end
