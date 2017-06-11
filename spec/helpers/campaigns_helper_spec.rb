require 'rails_helper'

RSpec.describe CampaignsHelper, type: :helper do
  describe '#html_description' do
    context 'when campaign has a description' do
      let(:campaign) { build(:christmas) }

      it 'shows the description and changes line breaks for <br> tags' do
        expected = 'Vamos celebrar um Natal único, um Natal nas ruas.<br><br> Venha celebrar com a gente.'
        expect(helper.html_description(campaign)).to eq(expected)
      end
    end

    context 'when campaign has no description' do
      let(:campaign) { build(:christmas, description: '') }

      it 'returns an empty string' do
        expect(helper.html_description(campaign)).to be_empty
      end
    end
  end

  describe '#items_for_select' do
    let(:campaign) { create(:christmas) }

    context 'when campaign has no items' do
      it 'returns an empty array' do
        expect(helper.items_for_select(campaign)).to be_empty
      end
    end

    context 'when campaign has items' do
      let!(:bread) { create(:bread, campaign: campaign) }
      let!(:wine) { create(:wine, campaign: campaign) }

      it 'lists all items to be used in a select' do
        expect(helper.items_for_select(campaign)).to eq([['Pão', bread.id],['Vinho', wine.id]])
      end
    end
  end

  describe '#collaborators_authors' do
    let(:campaign) { create(:christmas) }

    it 'lists the authors\'s names sorted by name' do
      create(:message_one, campaign: campaign)
      create(:message_two, campaign: campaign)

      expect(helper.collaborators_authors(campaign.campaign_messages)).to eq('Jane Roe<br>John Doe')
    end
  end

  describe '#valid_collaborators?' do
    let(:campaign) { create(:christmas) }

    context 'when there are valid collaborators' do
      it 'returns true' do
        create(:message_one, campaign: campaign)
        create(:message_two, campaign: campaign, author: '')
        expect(helper.valid_collaborators?(campaign)).to be_truthy
      end
    end

    context 'when there are no valid collaborator' do
      it 'returns false' do
        create(:message_two, campaign: campaign, author: '')
        expect(helper.valid_collaborators?(campaign)).to be_falsy
      end
    end
  end
end
