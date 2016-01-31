class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.references :cohort, index: true, foreign_key: true
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
