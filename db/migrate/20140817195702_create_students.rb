class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :username,         null: false
      t.string  :password_digest,  null: false
      t.string  :first_name,       null: false
      t.string  :last_name,        null: false
      t.string  :email
      t.string  :id_num,           null: false
      t.date    :dob,              null: false
      t.integer :grade,            null: false
      t.string  :gender,           null: false
      t.integer :login_counter,    default: 0

      t.timestamps
    end
  end
end
