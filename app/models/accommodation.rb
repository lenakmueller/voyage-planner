class Accommodation < ApplicationRecord
  belongs_to :trip
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :departure, presence: true
  validates :return_day, presence: true

  validate :at_least_one_field_present

  enum accommodation_mode: { hotel: 0, hostel: 1, appartment: 2, airbnb: 3, camping: 4 }

  CATEGORIES = ["hotel", "hostel", "appartment", "airbnb", "camping"]

  private

  def at_least_one_field_present
    if [booking_ref, location, departure, return_day, notes, photo].reject(&:blank?).empty?
      errors.add :base, "Please fill out at least one field"
    end
  end
end
