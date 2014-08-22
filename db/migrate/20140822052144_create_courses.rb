class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :teacher_id
      t.integer :period
      t.string :subject

      t.timestamps
    end
  end
end
