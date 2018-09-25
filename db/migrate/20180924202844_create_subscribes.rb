class CreateSubscribes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribes do |t|
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end

    add_column :posts, :community_id, :integer
    add_column :users, :nick, :string
    add_column :users, :avatar, :string
  end
end
