# frozen_string_literal: true

module Admin
  class AdministratorsController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @administrators = Administrator.name_ordered
                                     .page(index_params[:page])
                                     .per(INDEX_PER_PAGE)
    end

    private

    def index_params
      params.permit(:page)
    end
  end
end
