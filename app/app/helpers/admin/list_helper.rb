# frozen_string_literal: true

module Admin
  module ListHelper
    def list_data_attributes(href:)
      { controller: 'admin-list', action: 'click->admin-list#moveTo', href: }
    end
  end
end
