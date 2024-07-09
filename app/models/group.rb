class Group < ApplicationRecord
  has_many :customers, through: :group_users
  has_many :group_users, dependent: :destroy

  belongs_to :customers #会員id(オーナー)の取得
  belongs_to :genre

  # validates :introduction, presence: true
  # has_one_attached :image

  # # imageを呼び出した時に中身が空だったら、assets/images/no_image.jpgを呼び出す
  # def get_image
  #   (image.attached?) ? image : 'no_image.jpg'
  # end
end
