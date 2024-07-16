class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :genre

  has_many :favorite, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
end
