class AddProductCodeToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :product_code, :string
  end
end
