class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy

  #validates :name, uniqueness: true, presence: true
end
