class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, through: :user_jobs
  has_many :user_jobs

  has_many :lessons, through: :user_lessons
  has_many :user_lessons
end
