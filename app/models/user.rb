class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :socks, foreign_key: :owner_id, class_name: "Sock"
  has_many :bookings
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :location, :gender, :date_of_birth, :phone_number, presence: true
  validates :gender, inclusion: { in: %w[male female] }
end
