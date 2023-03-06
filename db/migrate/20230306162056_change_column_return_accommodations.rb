class ChangeColumnReturnAccommodations < ActiveRecord::Migration[7.0]
  def change
    remove_column :accommodations, :return, :string
    add_column :accommodations, :return_day, :string
  end
end
