# frozen_string_literal: true

module Admin
  module MediaPageSettings
    class MediaHeroImagesController < Admin::ApplicationController
      def new
        @media_hero_image = MediaHeroImage.new
      end

      def edit
        @media_hero_image = MediaHeroImage.find(params[:id])
      end

      def create
        @media_hero_image = MediaHeroImage.new(media_hero_image_params)

        if @media_hero_image.save
          redirect_to admin_media_page_setting_path
        else
          render :new
        end
      end

      def update
        @media_hero_image = MediaHeroImage.find(params[:id])

        if @media_hero_image.update(media_hero_image_params)
          redirect_to admin_media_page_setting_path
        else
          render :edit
        end
      end

      def destroy
        @media_hero_image = MediaHeroImage.find(params[:id])

        @media_hero_image.destroy

        redirect_to admin_media_page_setting_path
      end

      private

      def media_hero_image_params
        params.require(:media_hero_image).permit(:image)
      end
    end
  end
end
