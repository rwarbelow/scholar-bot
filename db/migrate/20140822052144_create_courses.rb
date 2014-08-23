class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :teacher_id
      t.string :subject
      t.integer :period_id
      t.timestamps
    end
  end
end
