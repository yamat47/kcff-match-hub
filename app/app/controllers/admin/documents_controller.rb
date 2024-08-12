# frozen_string_literal: true

module Admin
  class DocumentsController < Admin::ApplicationController
    def show
      render params[:slug]
    end
  end
end
