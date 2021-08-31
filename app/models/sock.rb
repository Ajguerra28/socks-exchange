class Sock < ApplicationRecord
  has_many :bookings
  belongs_to :owner, class_name: "User"
  has_one_attached :photo

  validates :type_of_socks, :price, :size, :color, :description, presence: true
end
