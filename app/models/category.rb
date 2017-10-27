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
end


