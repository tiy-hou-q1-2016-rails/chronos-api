class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, allow_null: false
      t.string :email, allow_null: false, unique: true
      t.string :phone_number, allow_null: false, unique: true
      t.references :cohort
      t.string :password_digest, allow_null: false

      t.timestamps null: false
    end
  end
end
