class ChangePriceTypeInItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :price, :integer, using: 'price::integer'
  end
end
