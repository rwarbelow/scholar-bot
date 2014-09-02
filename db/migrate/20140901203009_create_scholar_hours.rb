class CreateScholarHours < ActiveRecord::Migration
  def change
  	create_table :scholar_hours do |t|
    	t.integer :student_id
    	t.string :reason
    	t.string :description
    	t.date :date_assigned
    	t.date :date_served
    	t.integer :teacher_id
    end
  end
end
