class Transportation < ApplicationRecord
  belongs_to :trip
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :departure, presence: true
  validates :return_day, presence: true
  validates :transport_mode, presence: true
  validates :location, presence: true

  enum transport_mode: { flight: 0, train: 1, boat: 2, bike: 3, car: 4 }

  CATEGORIES = ["flight", "train", "boat", "bike", "car"]

end
