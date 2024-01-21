# frozen_string_literal: true

module Admin
  class AdministratorsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @administrators = Administrator.universal_id_ordered
                                     .search_by_keyword(index_params[:search])
                                     .page(index_params[:page])
                                     .per(INDEX_PER_PAGE)
    end

    def show
      @administrator = Administrator.find(params[:id])
    end

    def new
      @administrator = Administrator.new
    end

    def edit
      @administrator = Administrator.find(params[:id])
    end

    def create
      @administrator = Administrator.new(administrator_params)

      if @administrator.save
        redirect_to admin_administrator_path(@administrator)
      else
        render :new
      end
    end

    def update
      @administrator = Administrator.find(params[:id])

      if @administrator.update(administrator_params)
        redirect_to admin_administrator_path(@administrator)
      else
        render :edit
      end
    end

    def destroy
      @administrator = Administrator.find(params[:id])

      @administrator.destroy

      redirect_to admin_administrators_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def administrator_params
      params.require(:administrator).permit(:email)
    end
  end
end
