class Event < ApplicationRecord
 validates :title, presence: true
 validates :started_at, presence: true
 validates :location, presence: true

 has_many :event_categories, dependent: :destroy
 has_many :categories, through: :event_categories

 has_many :user_events, dependent: :destroy
 has_many :users, through: :user_events

 has_many :upload_files, dependent: :destroy

 enum status: { draft: 0, published: 1 }
 validates :status, inclusion: { in: Event.statuses.keys }


 def toggle_status!
     if draft?
       published!
     else
       draft!
     end
   end


 # geocoded_by :address
 # after_validation :geocode
end
