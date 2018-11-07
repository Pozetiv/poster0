require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Relations' do
    it { should belong_to(:community) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
  end
end
