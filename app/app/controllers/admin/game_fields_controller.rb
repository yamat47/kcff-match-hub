# frozen_string_literal: true

module Admin
  class GameFieldsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @game_fields = GameField.universal_id_ordered
                              # .search_by_keyword(index_params[:search])
                              .page(index_params[:page])
                              .per(INDEX_PER_PAGE)
    end

    def show
      @game_field = GameField.find(params[:id])
    end

    def new
      @game_field = GameField.new
    end

    def edit
      @game_field = GameField.find(params[:id])
    end

    def create
      @game_field = GameField.new(game_field_params)

      if @game_field.save
        redirect_to admin_game_field_path(@game_field)
      else
        render :new
      end
    end

    def update
      @game_field = GameField.find(params[:id])

      if @game_field.update(game_field_params)
        redirect_to admin_game_field_path(@game_field)
      else
        render :edit
      end
    end

    def destroy
      @game_field = GameField.find(params[:id])

      @game_field.destroy

      redirect_to admin_game_fields_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def game_field_params
      params.require(:game_field).permit(:name, :address, :google_maps_url)
    end
  end
end
