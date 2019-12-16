class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true
  validates :email, presence: true

  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs

  has_many :user_lessons, dependent: :destroy
  has_many :lessons, through: :user_lessons

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
      user.name =  auth.info.name
      end
  end

   mount_uploader :image, ImageUploader
   has_many :user_rooms
   has_many :rooms, through: :user_rooms
   has_many :posts

   has_many :user_groups
   has_many :groups,through: :user_groups



  def groupsJoin(group)
    groups << group
  
  end

  def groupsUnjoin(group)
    user_groups.find_by(group_id: group.id).destroy

  end

  def groupJoining?(group)
    groups.include?(group)
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
