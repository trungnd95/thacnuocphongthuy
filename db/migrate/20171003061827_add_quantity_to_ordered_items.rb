class AddQuantityToOrderedItems < ActiveRecord::Migration[5.1]
  def change
    add_column :ordered_items, :quantity, :integer
  end
end
