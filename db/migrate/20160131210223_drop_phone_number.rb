class DropPhoneNumber < ActiveRecord::Migration
  def change
    remove_column :students, :phone_number
  end
end
