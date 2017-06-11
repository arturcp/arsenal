require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#super_admin?' do
    context 'when user is super admin' do
      let(:user) { double(email: 'admin@arsenal.com.br') }

      it 'returns true' do
        expect(helper.super_admin?(user)).to be_truthy
      end
    end

    context 'when user is not super admin' do
      let(:user) { double(email: 'user@arsenal.com.br') }

      it 'returns false' do
        expect(helper.super_admin?(user)).to be_falsy
      end
    end
  end
end
