class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.integer :core_value_id
    	t.boolean :value
    	t.string  :name
    end
  end
end
