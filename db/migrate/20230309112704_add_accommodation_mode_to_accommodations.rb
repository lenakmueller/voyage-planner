class AddAccommodationModeToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :accommodation_mode, :integer
  end
end
