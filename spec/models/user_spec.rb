require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create user' do
    let!(:user) { create(:user) }

    it 'must be valid' do
      expect(user).to be_valid
    end

    it 'created default user' do
      binding.pry
      expect(user.admin).to be(false)
    end
  end
end
