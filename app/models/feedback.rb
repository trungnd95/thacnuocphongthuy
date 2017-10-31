class Feedback < ApplicationRecord
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :update}
  validates :content, presence: true, length: {minimum: 15}
  before_create :default_reply

  private
  def default_reply
    self.reply =  false
  end
end
