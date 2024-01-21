# frozen_string_literal: true

# Ensure URL is a valid https:// URL that matches the given host constraint.
# thanks to https://storck.io/posts/better-http-url-validation-in-ruby-on-rails/
#
# Example:
#
#   validates :youtube_url, url: { host: /(youtube\.com|youtu\.be)\Z/i }

# rubocop:disable Metrics/AbcSize
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    uri = URI.parse(value)

    record.errors.add(attribute, :https_only) unless uri.scheme == 'https'
    record.errors.add(attribute, :host_not_allowed) unless options[:host].nil? || uri.host =~ options[:host]
  rescue URI::InvalidURIError
    record.errors.add(attribute, :invalid)
  end
end
# rubocop:enable Metrics/AbcSize
