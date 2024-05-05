# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameField do
  describe '.order_by_name' do
    subject { described_class.order_by_name }

    let!(:game_field_b) { create(:game_field, name: 'B') }
    let!(:game_field_c) { create(:game_field, name: 'C') }
    let!(:game_field_a) { create(:game_field, name: 'A') }

    it { is_expected.to eq([game_field_a, game_field_b, game_field_c]) }
  end
end
