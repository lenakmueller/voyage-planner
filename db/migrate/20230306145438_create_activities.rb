class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :booking_ref
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :notes
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
