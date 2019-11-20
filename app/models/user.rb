class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :rented_pets, through: :bookings, source: :pet
  has_many :pets
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # has_many :rented_pets, through: :bookings, class_name: "Pet", foreign_key: "pet_id"
end
