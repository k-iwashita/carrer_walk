class Event < ApplicationRecord
 has_many :event_categories, dependent: :destroy
 has_many :categories, through: :event_categories

 has_many :upload_filesm, dependent: :destroy
end
