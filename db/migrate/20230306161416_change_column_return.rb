class ChangeColumnReturn < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :return, :string
    add_column :trips, :return_day, :string
  end
end
