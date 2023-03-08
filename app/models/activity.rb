class Activity < ApplicationRecord
  belongs_to :trip
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :at_least_one_field_present

  private

  def at_least_one_field_present
    if [name, booking_ref, date, start_time, end_time, notes, photo].reject(&:blank?).empty?
      errors.add :base, "Please fill out at least one field"
    end
  end
end
