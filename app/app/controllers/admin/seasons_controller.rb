# frozen_string_literal: true

module Admin
  class SeasonsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @seasons = Season.order_by_full_name
                       .search_by_keyword(index_params[:search])
                       .page(index_params[:page])
                       .per(INDEX_PER_PAGE)
    end

    def show
      @season = Season.find(params[:id])
    end

    def new
      @season = Season.new
    end

    def edit
      @season = Season.find(params[:id])
    end

    def create
      @season = Season.new(season_params)

      if @season.save
        redirect_to admin_season_path(@season)
      else
        render :new
      end
    end

    def update
      @season = Season.find(params[:id])

      if @season.update(season_params)
        redirect_to admin_season_path(@season)
      else
        render :edit
      end
    end

    def destroy
      @season = Season.find(params[:id])

      @season.destroy

      redirect_to admin_seasons_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def season_params
      params.require(:season).permit(:full_name, :short_name)
    end
  end
end
