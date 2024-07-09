class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :genre

  has_many :favorite, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
