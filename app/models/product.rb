class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }

  ORDER_BY = {
    newest: "created_at DESC",
    expensive: "price DESC",
    cheap: "price ASC"
  }

  validates :title, :description, :price, presence: true
  belongs_to :category
  has_one_attached :photo
end
