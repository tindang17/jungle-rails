class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, numericality:{greater_than: 0, less_than: 6}, presence: true
end
