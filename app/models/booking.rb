class Booking < ApplicationRecord
  belongs_to :user #owner e não user?
  belongs_to :sock
end
