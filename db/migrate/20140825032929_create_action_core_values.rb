class CreateActionCoreValues < ActiveRecord::Migration
  def change
    create_table :action_core_values do |t|
    	t.integer :core_value_id
    	t.integer :action_id
    end
  end
end
