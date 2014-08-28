class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.boolean :value
    	t.string :grouping
    	t.string  :name
    end
  end
end
