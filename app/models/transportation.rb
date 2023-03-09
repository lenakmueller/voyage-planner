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

  CATEGORIES = [["flight", "<i class='fa-solid fa-plane'></i>"],
                ["train", "<i class='fa-solid fa-train'></i>"],
                ["boat", "<i class='fa-solid fa-ship'></i>"],
                ["bike", "<i class='fa-solid fa-bicycle'></i>"],
                ["car", "<i class='fa-solid fa-car'></i>"]]
end
