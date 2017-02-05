require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  let(:bread) { create(:bread) }
  let(:wine) { create(:wine) }
  let(:cart) { ShoppingCart.new({}) }

  describe '#add' do
    context 'when quantity is valid' do
      it 'adds a single unit of an item' do
        cart.add(bread.id, 1)
        item = cart.items.first

        expect(item.id).to eq(bread.id)
        expect(item.current_amount).to eq(1)
      end

      it 'adds multiple units of an item' do
        cart.add(bread.id, 10)
        item = cart.items.first

        expect(item.id).to eq(bread.id)
        expect(item.current_amount).to eq(10)
      end
    end

    context 'when quantity is invalid' do
      it 'does not add an item if quantity is zero' do
        cart.add(bread.id, 0)

        expect(cart.items).to be_empty
      end

      it 'removes an existing item if new quantity is zero' do
        cart.add(bread.id, 1)
        expect(cart.items.count).to eq(1)

        cart.add(bread.id, 0)
        expect(cart.items).to be_empty
      end

      it 'does not add an item if quantity is negative' do
        cart.add(bread.id, -1)

        expect(cart.items).to be_empty
      end

      it 'removes an existing item if new quantity is negative' do
        cart.add(bread.id, 1)
        expect(cart.items.count).to eq(1)

        cart.add(bread.id, -1)
        expect(cart.items).to be_empty
      end
    end
  end

  describe '#remove' do
    context 'when item is in the cart' do
      it 'removes an item with one unit' do
        cart.add(bread.id, 1)
        expect(cart.items.count).to eq(1)

        cart.remove(bread.id)
        expect(cart.items).to be_empty
      end

      it 'removes an item with many units' do
        cart.add(bread.id, 10)
        expect(cart.items.count).to eq(1)

        cart.remove(bread.id)
        expect(cart.items).to be_empty
      end
    end

    context 'when item is not in the cart' do
      it 'does nothing' do
        cart.add(bread.id, 10)
        cart.remove(10)

        expect(cart.items.count).to eq(1)
      end
    end
  end

  describe '#total' do
    it 'sums to quantity of items in the cart' do
      cart.add(bread.id, 10)
      cart.add(wine.id, 2)

      expect(cart.total).to eq(12)
    end
  end

  describe '#price' do
    it 'sums the values of all items in the cart' do
      cart.add(bread.id, 10)
      cart.add(wine.id, 2)

      expect(cart.price).to eq(30) # 10 breads * 2.0 + 2 wines * 5.0
    end

    it 'returns zero if the cart is empty' do
      expect(cart.price).to eq(0)
    end
  end

  describe '#items' do
    context 'when cart is empty' do
      it 'returns an empty array' do
        expect(cart.items).to be_empty
      end
    end

    context 'when cart has items' do
      before do
        cart.add(bread.id, 10)
      end

      let(:item) { cart.items.first }

      it 'returns an array with instances of items' do
        expect(item.id).to eq(bread.id)
      end

      it 'includes the quantity in the instances' do
        expect(item.current_amount).to eq(10)
      end
    end
  end
end
