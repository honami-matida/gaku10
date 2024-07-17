class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :genre

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true

  def self.search_for(word)
    where('title LIKE ?', "%#{word}%")
  end
end
