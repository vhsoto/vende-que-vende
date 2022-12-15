class Product < ApplicationRecord
  validates :title, :description, :price, presence: true

  has_one_attached :photo
end
