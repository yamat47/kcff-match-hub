# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameField do
  describe '.order_by_name' do
    let!(:game_field1) { create(:game_field, name: 'B') }
    let!(:game_field2) { create(:game_field, name: 'C') }
    let!(:game_field3) { create(:game_field, name: 'A') }

    subject { described_class.order_by_name }

    it { is_expected.to eq([game_field3, game_field1, game_field2]) }
  end
end
