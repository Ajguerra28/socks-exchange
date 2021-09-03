class SocksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:type_of_socks]
      @socks = Sock.where(type_of_socks: params[:type_of_socks])
    elsif params[:query].present?
      sql_query = "color ILIKE :query OR type_of_socks ILIKE :query"
      @socks = Sock.where(sql_query, query: "%#{params[:query]}%")
    else
      @socks = Sock.all
    end
    @markers = @socks.map do |sock|
      {
        lat: sock.latitude,
        lng: sock.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { sock: sock }),

      }
    end
  end

  def show
    @sock = Sock.find(params[:id])
    @booking = Booking.new
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new(sock_params)
    @sock.owner = current_user
    if @sock.save
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  private

  def sock_params
    params.require(:sock).permit(:description, :type_of_socks, :price, :size, :color, :photo)
  end
end
