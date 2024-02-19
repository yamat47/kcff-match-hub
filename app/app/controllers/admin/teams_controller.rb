# frozen_string_literal: true

module Admin
  class TeamsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @teams = Team.universal_id_ordered
                   .search_by_keyword(index_params[:search])
                   .page(index_params[:page])
                   .per(INDEX_PER_PAGE)
    end

    def show
      @team = Team.find(params[:id])
    end

    def new
      @team = Team.new
    end

    def edit
      @team = Team.find(params[:id])
    end

    def create
      @team = Team.new(team_params)

      if @team.save
        redirect_to admin_team_path(@team)
      else
        render :new
      end
    end

    def update
      @team = Team.find(params[:id])

      if @team.update(team_params)
        redirect_to admin_team_path(@team)
      else
        render :edit
      end
    end

    def destroy
      @team = Team.find(params[:id])

      @team.destroy

      redirect_to admin_teams_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def team_params
      params.require(:team).permit(:name, :logo)
    end
  end
end
