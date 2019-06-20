class AddSubscribesCountToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :subscribes_count, :integer
  end
end
