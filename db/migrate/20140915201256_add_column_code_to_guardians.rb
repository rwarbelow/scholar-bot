class AddColumnCodeToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :code, :string
  end
end
