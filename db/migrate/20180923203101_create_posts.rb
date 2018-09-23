class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id, null: false

      t.timestamps
    end

    add_foreign_key :posts, :users
  end
end
