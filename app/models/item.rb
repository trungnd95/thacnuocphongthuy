class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :ordered_items
  has_many :orders, through: :ordered_items
  accepts_nested_attributes_for :images

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: {minimum: 20}
  validates :price, presence: true

  def reject_images (attributes)
    attributes['url'].blank?
  end
end
