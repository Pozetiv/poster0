class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :title
      t.string :text
      t.integer :community_id

      t.timestamps
    end

    add_foreign_key :rules, :communities
  end
end
