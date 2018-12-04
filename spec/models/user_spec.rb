require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Create user' do
    it 'must be valid' do
      user =  create(:user)
      expect(user).to be_valid
    end
  end
end
