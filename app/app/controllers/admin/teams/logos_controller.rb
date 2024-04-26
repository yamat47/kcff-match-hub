# frozen_string_literal: true

module Admin
  module Teams
    class LogosController < Admin::ApplicationController
      def new
        @team = Team.find(params[:team_id])
      end

      def edit
        @team = Team.find(params[:team_id])
      end

      def create
        @team = Team.find(params[:team_id])

        if @team.update(logo_params)
          redirect_to admin_team_path(@team)
        else
          render :edit
        end
      end

      def update
        @team = Team.find(params[:team_id])

        if @team.update(logo_params)
          redirect_to admin_team_path(@team)
        else
          render :edit
        end
      end

      def destroy
        @team = Team.find(params[:team_id])

        @team.logo.purge

        redirect_to admin_team_path(@team)
      end

      private

      def logo_params
        params.require(:team).permit(:logo)
      end
    end
  end
end
