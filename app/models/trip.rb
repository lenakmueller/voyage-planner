class Trip < ApplicationRecord
  belongs_to :user
  has_many :transportations
  has_many :accommodations
  has_many :activities
  # has_many_attached :photos

  validates :title, :location, :departure, :return_day, presence: true

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
