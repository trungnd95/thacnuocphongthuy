class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :ordered_items
  has_many :orders, through: :ordered_items
  accepts_nested_attributes_for :images

  scope :items_filter, ->(cat_id, start_range, end_range){
    unless cat_id.blank?
      where("category_id = ? AND price > ? AND price < ?", cat_id, start_range, end_range)
    else
      where("price > ? AND price < ?", start_range, end_range)
    end
  }
  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: {minimum: 20}
  validates :price, presence: true

  def reject_images (attributes)
    attributes['url'].blank?
  end

  def update_images_thumb thumb_val
    self.images.each do |img|
      img.update thumbnail: (img.url.file.original_filename == thumb_val) ? true : false
    end
  end

end
