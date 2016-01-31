class AddSignupCodetoCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :cohort_signup_code, :string, unique: true, null: false
  end
end
