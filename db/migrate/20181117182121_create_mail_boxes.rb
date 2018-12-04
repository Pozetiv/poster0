class CreateMailBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_boxes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
