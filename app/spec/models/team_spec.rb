# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team do
  describe '.order_by_name' do
    let!(:team1) { create(:team, name: '東京大学バイキングス') }
    let!(:team2) { create(:team, name: '慶應大学ダックス') }
    let!(:team3) { create(:team, name: '慶應大学バイソン') }

    subject { described_class.order_by_name }

    it { is_expected.to eq [team2, team3, team1] }
  end
end
