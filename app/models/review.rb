class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true
  validates :booking, presence: true
end
