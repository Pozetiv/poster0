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

  describe 'Create' do
    it 'be valid' do
      post = create(:post)
      expect(post).to be_valid
    end
  end

  describe 'SEARCH' do

    before { Timecop.freeze(Time.utc(2018, 07)) }

    let!(:post)  { create(:post) }
    let!(:post2) { create(:post) }

    context ".search" do
      it 'return object by nick' do
        expect(Post.search(post.user.nick)).to eq([post])
      end

      it 'returt object by community name' do
        expect(Post.search(post.community.name)).to eq([post])
      end

      it "return emty" do
        expect(Post.search('something text')).to be_empty
      end
    end

    it '.posts_user' do
      expect(Post.posts_user(post.user_id)).to eq([post])
    end

    it '.posts_community' do
      expect(Post.posts_community(post.community.name)).to eq([post])
    end

    it '.most_liked true list' do
      post.cached_weighted_average  = 5
      post2.cached_weighted_average = 1

      expect(Post.most_liked).to eq([post, post2])
    end

    it '.most_popular true list' do
      post.cached_votes_total = 5
      post2.cached_votes_total = 1

      expect(Post.most_popular).to eq([post, post2])
    end

    it '.trend_day true list' do
      post.cached_votes_total = 5
      post2.cached_votes_total = 1
      expect(Post.trend_day).to eq([post, post2])
    end
  end
end
