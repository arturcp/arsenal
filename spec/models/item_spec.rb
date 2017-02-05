require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#price_for_current_amount' do
    let(:bread) { create(:bread) }

    it 'calculates the price for the current amount' do
      bread.current_amount = 50
      expect(bread.price_for_current_amount).to eq(100)
    end
  end
end
