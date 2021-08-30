class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :socks
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :location, :gender, :date_of_birth, :phone_number, presence: true
  validates :gender, inclusion: { in: %w[male female] }
end
