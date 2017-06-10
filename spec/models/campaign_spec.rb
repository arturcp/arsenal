require 'rails_helper'

RSpec.describe Campaign, type: :model do
  include ActiveSupport::Testing::TimeHelpers

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '.to_display' do
    let(:enabled_campaign) { create(:christmas, :enabled) }
    let(:disabled_campaign) { create(:christmas, :disabled) }

    it 'lists only campaigns with status `true`' do
      expect(described_class.to_display).to eq([enabled_campaign])
    end
  end

  describe '.opened' do
    let(:campaign) { create(:christmas, :enabled) }
    let(:future_campaign) { create(:easter) }
    let(:past_campaign) { create(:church) }

    before { travel_to Date.parse('2016-11-15') }

    it 'lists ongoing campaigns' do
      expect(described_class.opened).to include(campaign)
    end

    it 'does not list future campaigns' do
      expect(described_class.opened).not_to include(future_campaign)
    end

    it 'does not list past campaigns' do
      expect(described_class.opened).not_to include(past_campaign)
    end
  end

  describe '.closed' do
    let(:campaign) { create(:christmas, :enabled) }
    let(:future_campaign) { create(:easter) }
    let(:past_campaign) { create(:church) }

    before { travel_to Date.parse('2016-11-15') }

    it 'does not list ongoing campaigns' do
      expect(described_class.closed).not_to include(campaign)
    end

    it 'lists future campaigns' do
      expect(described_class.closed).to include(future_campaign)
    end

    it 'lists past campaigns' do
      expect(described_class.closed).to include(past_campaign)
    end
  end

  describe '#type_text' do
    context 'when campaign uses termometers' do
      let(:campaign) { create(:christmas) }

      it 'returns the name for termometer' do
        expect(campaign.type_text).to eq('Termômetro')
      end
    end

    context 'when campaign uses circular progress chart' do
      let(:campaign) { create(:easter) }

      it 'returns the name for the circular progress chart' do
        expect(campaign.type_text).to eq('Progresso circular')
      end
    end
  end

  describe '#target_value' do
    context 'when campaign has no items' do
      let(:campaign) { create(:church) }

      it 'returns zero' do
        expect(campaign.target_value).to eq(0)
      end
    end

    context 'when campaign has items' do
      let(:campaign) { create(:christmas) }

      it 'calculates the total value of the campaign' do
        create(:bread, campaign: campaign)
        create(:wine, campaign: campaign)

        expect(campaign.target_value).to eq(20)
      end
    end
  end

  describe '#current_amount' do
    context 'when campaign has no items' do
      let(:campaign) { create(:church) }

      it 'returns zero' do
        expect(campaign.current_amount).to eq(0)
      end
    end

    context 'when campaign has items' do
      let(:campaign) { create(:christmas) }

      it 'calculates the total value of the campaign' do
        create(:bread, campaign: campaign)
        create(:wine, campaign: campaign)

        expect(campaign.current_amount).to eq(9)
      end
    end
  end

  describe '#finished?' do
    let(:campaign) { create(:christmas) }

    context 'when the campaign did not finish yet' do
      before { travel_to Date.parse('2016-11-15') }

      it 'returns false' do
        expect(campaign).not_to be_finished
      end
    end

    context 'when the campaign is finished' do
      before { travel_to Date.parse('2020-11-15') }

      it 'returns true' do
        expect(campaign).to be_finished
      end
    end
  end

  describe '#messages_by_status' do
    let(:campaign) { create(:christmas) }
    let(:active_message) { create(:message_one, :active, campaign: campaign) }
    let(:inactive_message) { create(:message_one, :inactive, campaign: campaign) }
    let(:pending_message) { create(:message_one, campaign: campaign) }

    context 'when status is provided' do
      it 'returns the active messages' do
        expect(campaign.messages_by_status(status: true)).to eq([active_message])
      end

      it 'returns the inactive messages' do
        expect(campaign.messages_by_status(status: false)).to eq([inactive_message])
      end
    end

    context 'when status is not provided' do
      it 'returns all the pending messages' do
        expect(campaign.messages_by_status(status: nil)).to eq([pending_message])
      end
    end
  end
end
