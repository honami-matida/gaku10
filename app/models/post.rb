class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :genre

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :week_favorites, -> { where(created_at: 1.week.ago.beginning_of_day..Time.current.end_of_day) }

  validates :title, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}

  paginates_per 9

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search_for(word)
    where('title LIKE ?', "%#{word}%")
  end
end
