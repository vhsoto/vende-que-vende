class Product < ApplicationRecord
  include PgSearch::Model
  include Favoritable

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
  belongs_to :user, default: -> { Current.user }

  has_one_attached :photo

  def owner?
    user_id == Current.user&.id
  end

  def broadcast
    broadcast_replace_to self, partial: 'products/product_detail', locals: { product: self}
  end
end
