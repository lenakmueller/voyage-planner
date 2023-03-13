class User < ApplicationRecord
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trips
  has_many :friends

  validates :first_name, :last_name, :nickname, presence: true
end
