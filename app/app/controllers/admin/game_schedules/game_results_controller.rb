# frozen_string_literal: true

module Admin
  module GameSchedules
    class GameResultsController < Admin::ApplicationController
      def new
        @game_schedule = GameSchedule.find(params[:game_schedule_id])
        @game_result = GameResult.new(game_schedule: @game_schedule)
      end

      def edit
        @game_schedule = GameSchedule.find(params[:game_schedule_id])
        @game_result = @game_schedule.game_result
      end

      def create
        @game_schedule = GameSchedule.find(params[:game_schedule_id])
        @game_result = GameResult.new(game_schedule: @game_schedule)

        @game_result.attributes = game_result_params

        if @game_result.save
          redirect_to admin_game_schedule_path(@game_schedule)
        else
          render :new
        end
      end

      def update
        @game_schedule = GameSchedule.find(params[:game_schedule_id])
        @game_result = @game_schedule.game_result

        @game_result.attributes = game_result_params

        if @game_result.save
          redirect_to admin_game_schedule_path(@game_schedule)
        else
          render :edit
        end
      end

      def destroy
        @game_schedule = GameSchedule.find(params[:game_schedule_id])
        @game_result = @game_schedule.game_result

        @game_result.destroy

        redirect_to admin_game_schedule_path(@game_schedule)
      end

      private

      def game_result_params
        params.require(:game_result).permit(:result, :home_team_score, :visitor_team_score)
      end
    end
  end
end
