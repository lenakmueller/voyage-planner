class AddNotesToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :notes, :text
  end
end
