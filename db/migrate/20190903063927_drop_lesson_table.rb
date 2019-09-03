class DropLessonTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :lessons  
  end
end
