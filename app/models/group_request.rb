class GroupRequest < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :group, dependent: :destroy

  enum is_status: { pending: 0, approved: 1, rejected: 2 }

  validates :is_status, presence: true
end
