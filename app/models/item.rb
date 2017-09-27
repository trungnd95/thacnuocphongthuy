class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :ordered_items
  has_many :orders, through: :ordered_items
end
