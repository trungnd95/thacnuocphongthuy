class Image < ApplicationRecord
  mount_uploader :url, UrlUploader
  belongs_to :item
end
