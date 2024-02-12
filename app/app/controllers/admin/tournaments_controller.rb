# frozen_string_literal: true

module Admin
  class TournamentsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @tournaments = Tournament.universal_id_ordered
                               .search_by_keyword(index_params[:search])
                               .page(index_params[:page])
                               .per(INDEX_PER_PAGE)
    end

    def show
      @tournament = Tournament.find(params[:id])
    end

    def new
      @tournament = Tournament.new
    end

    def edit
      @tournament = Tournament.find(params[:id])
    end

    def create
      @tournament = Tournament.new(tournament_params)

      if @tournament.save
        redirect_to admin_tournament_path(@tournament)
      else
        render :new
      end
    end

    def update
      @tournament = Tournament.find(params[:id])

      if @tournament.update(tournament_params)
        redirect_to admin_tournament_path(@tournament)
      else
        render :edit
      end
    end

    def destroy
      @tournament = Tournament.find(params[:id])

      @tournament.destroy

      redirect_to admin_tournaments_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def tournament_params
      params.require(:tournament).permit(:name)
    end
  end
end
