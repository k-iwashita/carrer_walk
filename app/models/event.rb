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

 # geocoded_by :address
 # after_validation :geocode

 # カテゴリーを加える
 def add_category(category)
  categories << category
 end
  # イベントに登録されているカテゴリーの削除
 def delete_category(category)
   event_categories.find_by(category: category.id).destroy
 end
 # イベントにそのカテゴリーが含まれるか確認する
 def category_include?(category)
   categories.include?(category)
 end
end
