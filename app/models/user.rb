class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :socks, foreign_key: :owner_id, class_name: "Sock"
  has_many :bookings
  has_one_attached :avatar
  geocoded_by :location

  after_validation :geocode, if: :will_save_change_to_location?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
