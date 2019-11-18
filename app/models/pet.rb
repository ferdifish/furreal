class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :species, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :photo, presence: true
  validates :user, presence: true
end
