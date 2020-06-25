class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :subtitle, use: :slugged
  belongs_to :category

  has_many :line_items
end
