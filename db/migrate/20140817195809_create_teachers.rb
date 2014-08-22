class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string   :username,         null: false
      t.string   :password_digest,  null: false
      t.string   :first_name,       null: false
      t.string   :last_name,        null: false
      t.string   :email,            null: false
      t.string   :title,            null: false
      t.boolean  :is_admin,         default: false
      t.integer :login_counter,     default: 0

      t.timestamps
    end
  end
end
