# frozen_string_literal: true

module Admin
  class NoticesController < ApplicationController
    INDEX_PER_PAGE = 30

    def index
      @notices = Notice.universal_id_ordered
                       .search_by_keyword(index_params[:search])
                       .page(index_params[:page])
                       .per(INDEX_PER_PAGE)
    end

    def show
      @notice = Notice.find(params[:id])
    end

    def new
      @notice = Notice.new
    end

    def edit
      @notice = Notice.find(params[:id])
    end

    def create
      @notice = Notice.new(notice_params)

      if @notice.save
        redirect_to admin_notice_path(@notice)
      else
        render :new
      end
    end

    def update
      @notice = Notice.find(params[:id])

      if @notice.update(notice_params)
        redirect_to admin_notice_path(@notice)
      else
        render :edit
      end
    end

    def destroy
      @notice = Notice.find(params[:id])

      @notice.destroy

      redirect_to admin_notices_path
    end

    private

    def index_params
      params.permit(:search, :page)
    end

    def notice_params
      params.require(:notice).permit(:title, :content)
    end
  end
end
