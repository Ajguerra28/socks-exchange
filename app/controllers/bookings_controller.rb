class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_booking, only: %i[show edit update destroy]

  def create
    @booking = Booking.new(status: 0)
    @sock = Sock.find(params[:sock_id])
    @booking.sock = @sock
    @booking.user = current_user

    authorize @booking

    if @booking.save
      @sock.quantity -= 1
      @sock.save
      redirect_to sock_path(@sock, booked: true)#, notice: 'Great! You just bought an amazing pair of socks!'
    else
      render '/socks/show'
    end
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
