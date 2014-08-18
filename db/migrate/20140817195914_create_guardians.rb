class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :username,         :null => false
      t.string :password_digest,  :null => false
      t.string :first_name,       :null => false
      t.string :last_name,        :null => false
      t.string :email

      t.timestamps
    end
  end
end
