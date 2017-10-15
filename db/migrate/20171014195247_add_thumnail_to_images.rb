class AddThumnailToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :thumbnail, :boolean, default: false
  end
end
