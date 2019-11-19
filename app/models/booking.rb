class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :pet, presence: true
  validates :user, presence: true
end
