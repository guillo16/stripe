class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :subtitle, use: :slugged
  belongs_to :category
end
