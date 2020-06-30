class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :photo, presence: true
end
