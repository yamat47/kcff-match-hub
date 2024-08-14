# frozen_string_literal: true

module Media
  module SeoHelper
    BASE_PAGE_TITLE = '関東学生フットボールクラブ連盟 公式サイト'

    def media_page_title(title)
      [title, BASE_PAGE_TITLE].filter_map(&:presence).join('｜')
    end
  end
end
