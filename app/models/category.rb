class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id",
    dependent: :destroy
  belongs_to :parent, class_name: "Category", optional: true
  has_many :items

  validates :name, presence: true, uniqueness: true

  def self.find_root_parent cat
    unless cat.parent.blank?
      cat.parent
      unless cat.parent.parent.blank?
        find_root_parent cat.parent
      end
    end
  end

  def get_items tmp_items=[], home_page=true
    if self.subcategories.size > 0
      self.subcategories.each do |sub|
        tmp_items << sub.get_items(tmp_items)
      end
    else
      tmp_items << self.items.to_a
    end
    if home_page
      tmp_items.reject(&:empty?).flatten.uniq.take(5)
    else
      tmp_items.reject(&:empty?).flatten.uniq
    end
  end
end



