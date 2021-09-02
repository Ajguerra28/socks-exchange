class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sock

  # before_create :set_default_status

  # def set_default_status
  #   self.status = 0
  # end
end
