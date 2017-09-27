class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :content
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
