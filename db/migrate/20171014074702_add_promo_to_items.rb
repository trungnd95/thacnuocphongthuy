class AddPromoToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :promo, :integer, default: 0
  end
end
