class Order < ApplicationRecord
  has_many :ordered_items
  has_many :items, though: :ordered_items
end