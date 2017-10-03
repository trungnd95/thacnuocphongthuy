class Order < ApplicationRecord
  belongs_to :order_status
  has_many :ordered_items
  has_many :items, though: :ordered_items
end
