class AddSlugToPostsAndCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :slug, :string
    add_column :communities, :slug, :string
  end
end
