class CreateStudentActions < ActiveRecord::Migration
  def change
    create_table :student_actions do |t|
    	t.integer :enrollment_id
    	t.integer :action_id
    	t.text 		:comment
    	t.date 		:date
    	t.integer :scholar_hour_id

    	t.timestamps
    end
  end
end
