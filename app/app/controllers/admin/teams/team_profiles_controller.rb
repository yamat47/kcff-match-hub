# frozen_string_literal: true

module Admin
  module Teams
    class TeamProfilesController < Admin::ApplicationController
      def new
        @team = Team.find(params[:team_id])
        @team_profile = TeamProfile.new(team: @team)
      end

      def edit
        @team = Team.find(params[:team_id])
        @team_profile = @team.team_profile
      end

      def create
        @team = Team.find(params[:team_id])
        @team_profile = TeamProfile.new(team: @team)

        @team_profile.attributes = team_profile_params

        if @team_profile.save
          redirect_to admin_team_path(@team)
        else
          render :new
        end
      end

      def update
        @team = Team.find(params[:team_id])
        @team_profile = @team.team_profile

        @team_profile.attributes = team_profile_params

        if @team_profile.save
          redirect_to admin_team_path(@team)
        else
          render :edit
        end
      end

      private

      def team_profile_params
        params.require(:team_profile).permit(:x_url, :instagram_url, :homepage_url)
      end
    end
  end
end
