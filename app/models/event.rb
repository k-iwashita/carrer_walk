class Event < ApplicationRecord
 has_many :event_categories, dependent: :destroy
 has_many :categories, through: :event_categories

 has_many :user_events, dependent: :destroy
 has_many :users, through: :user_events

 has_many :upload_files, dependent: :destroy
end
