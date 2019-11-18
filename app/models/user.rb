class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :rented_pets, through: :bookings, source: :pet
  has_many :pets
  # has_many :rented_pets, through: :bookings, class_name: "Pet", foreign_key: "pet_id"
end
