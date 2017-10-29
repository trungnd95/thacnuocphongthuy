class AddTotalPriceToOrderedItem < ActiveRecord::Migration[5.1]
  def change
    add_column :ordered_items, :total_price, :integer
  end
end
