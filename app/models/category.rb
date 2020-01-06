class Category < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :event, through: :event_categories

  def add_event
    
  end
end
