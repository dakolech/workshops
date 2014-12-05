class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :description, presence: true
  validates :title, presence: true

  def average_rating
    if reviews.count == 0
      "There is no reviews for this product"
    else
      rating = 0.0
      reviews.each do |el|
        rating += el.rating
      end
      rating /= reviews.count
    end

  end

end
