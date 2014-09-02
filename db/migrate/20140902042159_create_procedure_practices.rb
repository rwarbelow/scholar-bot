class CreateProcedurePractices < ActiveRecord::Migration
	def change
		create_table :procedure_practices do |t|
			t.integer :student_id
			t.string :procedure
			t.string :description
			t.date :date_assigned
			t.date :date_served
			t.integer :teacher_id
		end
	end
end
