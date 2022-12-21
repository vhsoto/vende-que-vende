class Product < ApplicationRecord
  validates :title, :description, :price, presence: true

  belongs_to :category

  has_one_attached :photo
end
