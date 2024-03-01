# frozen_string_literal: true

module FormBuilder
  class AdminFormBuilder < ::ActionView::Helpers::FormBuilder
    delegate :tag, :safe_join, :check_box_tag, :image_tag, to: :@template

    def select_with_image(method, collection, options = {})
      identifier = "#{object_name}_#{method}"
      value_method, text_method, image_method, blank_options = options.values_at(:value_method, :text_method, :image_method, :blank_options)

      if value_method.nil? || text_method.nil? || blank_options.nil?
        raise ArgumentError, 'value_method, text_method, and image_method are required'
      end

      tag.div(class: 'admin-form-select js-admin-form-select-container') do
        check_box_tag('', '', false, id: "#{identifier}_toggle", class: 'js-admin-form-select-toggle') +
          select_button_tag(identifier:) +
          select_list_tag(identifier:, collection:, method:, value_method:, text_method:, image_method:, blank_options:)
      end
    end

    private

    def select_button_tag(identifier:)
      tag.div(class: 'admin-form-select__button') do
        tag.label(class: 'admin-form-select-button', for: "#{identifier}_toggle") do
          tag.div(class: 'admin-form-select-button__selected') do
            tag.div(class: 'admin-form-select-list-item js-admin-form-select-button-selected')
          end +
            tag.div(class: 'admin-form-select-button__icon') do
              tag.div(class: 'admin-form-select-button-icon')
            end
        end
      end
    end

    def select_list_tag(identifier:, collection:, method:, value_method:, text_method:, blank_options:, image_method: nil)
      blank_image_src = blank_options[:image_src]
      blank_label = blank_options[:label]

      raise ArgumentError, 'blank image_src and label are required' if blank_image_src.nil? || blank_label.nil?

      tag.div(class: 'admin-form-select__list') do
        tag.div(class: 'admin-form-select-list') do
          blank_list_item_tag(method:, identifier:, image_src: blank_image_src, label: blank_label) +
            collection_list_tag(identifier:, collection:, method:, value_method:, text_method:, image_method:)
        end
      end
    end

    def blank_list_item_tag(method:, identifier:, image_src:, label:)
      value = ''
      id = "#{identifier}_blank"

      list_item_tag(method:, value:, id:, image_src:, label:)
    end

    def collection_list_tag(identifier:, collection:, method:, value_method:, text_method:, image_method:)
      safe_join(
        collection.map do |item|
          collection_list_item_tag(identifier:, item:, method:, value_method:, text_method:, image_method:)
        end
      )
    end

    def collection_list_item_tag(identifier:, item:, method:, value_method:, text_method:, image_method:)
      value = item.send(value_method)
      id = "#{identifier}_#{value}"
      image_src = image_method.nil? ? nil : item.send(image_method)
      label = item.send(text_method)

      list_item_tag(method:, value:, id:, image_src:, label:)
    end

    def list_item_tag(method:, value:, id:, label:, image_src: nil)
      tag.label(class: 'admin-form-select-list__item js-admin-form-select-list-item-container', for: id) do
        radio_button(method, value, id:, class: 'admin-form-select-list-item-radio', required: true, data: { controller: 'admin-form-select', action: 'admin-form-select#select' }) +
          tag.div(class: 'admin-form-select-list-item js-admin-form-select-list-item') do
            image_src.nil? ? list_item_label_tag(label:) : list_item_label_image_tag(image_src:, label:)
          end
      end
    end

    def list_item_label_tag(label:)
      tag.div(class: 'admin-form-select-list-item__label') do
        tag.div(class: 'admin-form-select-list-item-label') do
          label
        end
      end
    end

    def list_item_label_image_tag(image_src:, label:)
      tag.div(class: 'admin-form-select-list-item__image') do
        image_tag(image_src, class: 'admin-form-select-list-item-image')
      end + list_item_label_tag(label:)
    end
  end
end
