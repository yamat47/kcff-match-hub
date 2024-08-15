# frozen_string_literal: true

module Admin
  class GameSchedulesController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @game_schedules = GameSchedule.start_at_ordered
                                    .search_by_keyword(index_params[:search])
                                    .preload(:season, :tournament, :home_team, :visitor_team, :game_field)
                                    .page(index_params[:page])
                                    .per(INDEX_PER_PAGE)
    end

    def show
      @game_schedule = GameSchedule.find(params[:id])
    end

    def new
      @game_schedule = GameSchedule.new
    end

    def edit
      @game_schedule = GameSchedule.find(params[:id])
    end

    def create
      @game_schedule = GameSchedule.new(game_schedule_params)

      if @game_schedule.save
        redirect_to admin_game_schedule_path(@game_schedule)
      else
        render :new
      end
    end

    def update
      @game_schedule = GameSchedule.find(params[:id])

      if @game_schedule.update(game_schedule_params)
        redirect_to admin_game_schedule_path(@game_schedule)
      else
        render :edit
      end
    end

    def destroy
      @game_schedule = GameSchedule.find(params[:id])

      @game_schedule.destroy

      redirect_to admin_game_schedules_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def game_schedule_params
      params.require(:game_schedule)
            .permit(:season_id, :home_team_id, :visitor_team_id, :game_field_id, :tournament_id, :start_at)
    end
  end
end
