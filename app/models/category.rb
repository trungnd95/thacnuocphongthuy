class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id",
    dependent: :destroy
  belongs_to :parent, class_name: "Category", optional: true
  has_many :items

  validates :name, presence: true, uniqueness: true
end


