class Trip < ApplicationRecord
  belongs_to :user
  has_many :transportations
  has_many :accommodations
  has_many :activities
  has_many :friends
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :location, :departure, :return_day, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true }
    }

  # def date_cannot_be_in_the_past
  #   return unless departure.present? && return_day.present?

  #   if departure < Date.today
  #     add_past_date_error(errors, :departure)
  #   end

  #   if return_day < Date.today
  #     add_past_date_error(errors, :return_day)
  #   end
  # end

  # def add_past_date_error(errors, attribute)
  #   errors.add(attribute, "can't be in the past")
  # end
end
