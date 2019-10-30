class Event < ApplicationRecord
 validates :title, presence: true
 validates :started_at, presence: true
 validates :location, presence: true

 has_many :event_categories, dependent: :destroy
 has_many :categories, through: :event_categories

 has_many :user_events, dependent: :destroy
 has_many :users, through: :user_events

 has_many :upload_files, dependent: :destroy

 geocoded_by :location
 after_validation :gecode
end
