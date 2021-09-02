class Sock < ApplicationRecord

  has_many :bookings
  belongs_to :owner, class_name: "User"
  has_one_attached :photo

  validates :type_of_socks, :price, :size, :color, :description, presence: true

  enum status: {
    active: 0,
    pending: 1,
    unavailable: 2
  }

  # pgsearch gem

  include PgSearch::Model
  pg_search_scope :search_by_color_and_type_of_sock, against: %i[color type_of_socks], using: { tsearch: { prefix: true } }
end
