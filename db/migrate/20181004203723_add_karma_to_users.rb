class AddKarmaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :karma, :integer, default: 1
  end
end
