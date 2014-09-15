class CreateSwotReports < ActiveRecord::Migration
  def change
    create_table :swot_reports do |t|
    	t.integer  :guardianship_id
    	t.boolean  :grade_check
    	t.boolean  :scholar_hours_check
    	t.boolean  :procedure_practices_check
    	t.boolean  :behavior_check
    	t.boolean  :home_check
    	t.boolean  :paper_check
    	t.text 	   :comments
    	t.timestamps
    end
  end
end
