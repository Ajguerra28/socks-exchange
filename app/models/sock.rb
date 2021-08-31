class Sock < ApplicationRecord
  has_many :bookings
  belongs_to :owner, class_name: "User"

  validates :type_of_socks, :price, :size, :color, :description, presence: true

  enum status: {
    active: 0,
    pending: 1,
    unavailable: 2
  }
end
