# frozen_string_literal: true

require 'factory_bot'

%w[2019 2020 2021 2022 2023 2024].each do |year|
  FactoryBot.create(:season, full_name: "#{year}年度", short_name: year)
end
