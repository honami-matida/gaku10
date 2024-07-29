class GroupUser < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :customer, dependent: :destroy
end
