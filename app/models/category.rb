class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id",
    dependent: :destroy
  belongs_to :parent, class_name: "Category"
  has_many :items
end


