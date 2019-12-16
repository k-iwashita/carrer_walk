class Group < ApplicationRecord
  validates :name, presence: true
  validates :description,presence: true

  has_many :user_groups
  has_many :users,through: :user_groups

  


end
