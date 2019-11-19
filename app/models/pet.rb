class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :species, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :photos, presence: true
  validates :user, presence: true
end
