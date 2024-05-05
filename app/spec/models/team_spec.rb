# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team do
  describe '.order_by_name' do
    subject { described_class.order_by_name }

    let!(:team_vikings) { create(:team, name: '東京大学バイキングス') }
    let!(:team_ducks) { create(:team, name: '慶應大学ダックス') }
    let!(:team_bison) { create(:team, name: '慶應大学バイソン') }

    it { is_expected.to eq [team_ducks, team_bison, team_vikings] }
  end
end
