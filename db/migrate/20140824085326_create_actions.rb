class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.integer :action_core_value_id
    	t.boolean :value
    	t.string  :name
    end
  end
end
