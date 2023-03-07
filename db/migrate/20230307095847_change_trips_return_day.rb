class ChangeTripsReturnDay < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :return_day, :string
    add_column :trips, :return_day, :date
  end
end
