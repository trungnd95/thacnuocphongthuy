class SysInfo < ApplicationRecord
  validates :hotline, presence: true, numericality: true, length: 9..12
  validates :address, presence: true, length: {minimum: 5}
  validates :about_us, presence: true, length: {minimum: 15}
  validates :facebook_page_url, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :update}
end
