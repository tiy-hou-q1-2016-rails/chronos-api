class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name, allow_null: false, unique: true
      t.boolean :active, default: true
      t.string :beacon_id, allow_null: false, unique: true
      t.string :campus_name, allow_null: false, unique: true

      t.timestamps null: false
    end
  end
end
