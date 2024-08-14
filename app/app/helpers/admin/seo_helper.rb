# frozen_string_literal: true

module Admin
  module SeoHelper
    BASE_PAGE_TITLE = 'KCFF 管理画面'

    def admin_page_title(title)
      [title, BASE_PAGE_TITLE].filter_map(&:presence).join('｜')
    end
  end
end
