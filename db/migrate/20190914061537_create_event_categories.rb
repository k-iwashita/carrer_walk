# -*- encoding : utf-8 -*-
class CreateEventCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :event_categories do |t|
      t.references :event, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
