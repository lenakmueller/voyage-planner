class Accommodation < ApplicationRecord
  belongs_to :trip

  validate :at_least_one_field_present

  private

  def at_least_one_field_present
    if [booking_ref, location, departure, return_day, notes].reject(&:blank?).empty?
      errors.add :base, "Please fill out at least one field"
    end
  end
end
