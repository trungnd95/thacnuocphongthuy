class Image < ApplicationRecord
  mount_uploader :url, UrlUploader
  belongs_to :item

  scope :image_thumb, -> (item_id){where(item_id: item_id).where(thumbnail: true)}
end
