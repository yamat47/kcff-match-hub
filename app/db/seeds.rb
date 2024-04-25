# frozen_string_literal: true

Dir[Rails.root.join('db/seeds/*.rb').to_s].each do |filename|
  Rails.logger.debug { "Loading seed file: #{filename}" }
  load filename
end
