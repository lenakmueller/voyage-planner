class ChangeTypeOfRenturnDayInTransportations < ActiveRecord::Migration[7.0]
  def change
    remove_column :transportations, :return_day
    add_column :transportations, :return_day, :date
  end
end
