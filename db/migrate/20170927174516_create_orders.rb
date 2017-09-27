class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :cell_phone_number
      t.string :address

      t.timestamps
    end
  end
end
