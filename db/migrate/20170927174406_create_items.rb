class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.string :video
      t.string :price
      t.boolean :availibility

      t.timestamps
    end
  end
end
