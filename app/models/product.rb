class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :subtitle, use: :slugged
  belongs_to :category
  monetize :price_cents

  has_many :line_items, dependent: :destroy
end
