class CreateCoreValues < ActiveRecord::Migration
  def change
    create_table :core_values do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
