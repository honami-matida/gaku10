class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true

  paginates_per 9

  #validates :name, uniqueness: true, presence: true
end
