class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :detail, limit: 10000
      t.timestamp :publish_start_at
      t.timestamp :publish_end_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
