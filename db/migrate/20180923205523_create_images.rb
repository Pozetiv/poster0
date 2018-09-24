class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :post_id

      t.timestamps
    end
    add_foreign_key :images, :posts
  end
end
