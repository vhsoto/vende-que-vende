class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }

  validates :title, :description, :price, presence: true
  belongs_to :category
  has_one_attached :photo
end
