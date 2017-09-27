class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :image_type
      t.string :url
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
