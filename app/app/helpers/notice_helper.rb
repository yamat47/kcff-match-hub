# frozen_string_literal: true

module NoticeHelper
  def formatted_notice_content(content)
    auto_link(
      simple_format(content),
      html: { class: 'common-text-link', target: '_blank' }
    )
  end
end
