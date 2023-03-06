class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.date :departure
      t.date :return
      t.string :booking_ref
      t.string :location
      t.text :notes
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
