class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :groups, dependent: :destroy #会員id(オーナーの取得)
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  #is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_active == true)
  end
end
