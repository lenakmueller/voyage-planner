class Trip < ApplicationRecord
  belongs_to :user
  has_many :transportations
  has_many :accommodations
  has_many :activities
end
