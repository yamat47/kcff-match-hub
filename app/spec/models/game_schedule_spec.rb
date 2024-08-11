# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameSchedule do
  describe '.from_today' do
    let!(:game_schedule_today) { create(:game_schedule, start_at: Time.current) }
    let!(:game_schedule_tomorrow) { create(:game_schedule, start_at: 1.day.from_now) }

    before do
      create(:game_schedule, start_at: 1.day.ago)
    end

    context 'when argument is given' do
      subject { described_class.from_today(now: 1.day.from_now) }

      it { is_expected.to eq([game_schedule_tomorrow]) }
    end

    context 'when argument is not given' do
      subject { described_class.from_today }

      it { is_expected.to eq([game_schedule_today, game_schedule_tomorrow]) }
    end
  end

  describe '.next_scheduled_games' do
    let!(:game_schedule_today_am) { create(:game_schedule, start_at: Time.current.beginning_of_day + 10.hours) }
    let!(:game_schedule_today_pm) { create(:game_schedule, start_at: Time.current.end_of_day - 10.hours) }
    let!(:game_schedule_tomorrow_am) { create(:game_schedule, start_at: 1.day.from_now.beginning_of_day + 10.hours) }
    let!(:game_schedule_tomorrow_pm) { create(:game_schedule, start_at: 1.day.from_now.end_of_day - 10.hours) }

    context 'when argument is given' do
      subject { described_class.next_scheduled_games(now: 1.day.from_now) }

      it { is_expected.to contain_exactly(game_schedule_tomorrow_am, game_schedule_tomorrow_pm) }
    end

    context 'when argument is given but no game is scheduled' do
      subject { described_class.next_scheduled_games(now: 2.days.from_now) }

      it { is_expected.to be_empty }
    end

    context 'when argument is not given' do
      subject { described_class.next_scheduled_games }

      it { is_expected.to contain_exactly(game_schedule_today_am, game_schedule_today_pm) }
    end
  end
end
