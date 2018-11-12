class AddTypeToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :category, :string, index: true
  end
end
