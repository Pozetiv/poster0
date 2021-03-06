require 'rails_helper'

RSpec.describe Community, type: :model do
  describe 'Relations' do
    it { should have_many(:posts) }
    it { should have_many(:subscribes) }
    it { should have_many(:rules) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Create' do
    it 'be valid' do
      comm = create(:community)
      expect(comm).to be_valid
    end
  end
end
