class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :day, index: true, foreign_key: true
      t.datetime :checkin_at
      t.string :status, default: "pending"

      t.timestamps null: false
    end
  end
end
