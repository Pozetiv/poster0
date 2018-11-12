class CommunityAdministrations < ActiveRecord::Migration[5.2]
  def change
    create_table :community_administrations do |t|
      t.integer :user_id
      t.integer :community_id
    end
    add_foreign_key :community_administrations, :users
    add_column :communities, :user_id, :integer
    add_column :users, :admin, :boolean, default: false
  end
end
