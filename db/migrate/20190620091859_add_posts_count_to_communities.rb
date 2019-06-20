class AddPostsCountToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :posts_count, :integer
  end
end
