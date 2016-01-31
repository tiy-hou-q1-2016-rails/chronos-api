class AddUtcStartForCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :start_hour_utc, :integer, default: 15
    add_column :cohorts, :start_min_utc, :integer, default: 30

  end
end
