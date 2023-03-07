class ChangeTypeForReturnDayInAccommodations < ActiveRecord::Migration[7.0]
  def change
    remove_column :accommodations, :return_day
    add_column :accommodations, :return_day, :date
  end
end
