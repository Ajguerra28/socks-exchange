class SocksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:type_of_socks]
      @socks = policy_scope(Sock).where(type_of_socks: params[:type_of_socks])
    elsif params[:query].present?
      sql_query = "color ILIKE :query OR type_of_socks ILIKE :query"
      @socks = policy_scope(Sock).where(sql_query, query: "%#{params[:query]}%")
    else
      @socks = policy_scope(Sock)
    end
  end

  def my_socks
    @socks = Sock.where(owner_id: current_user)
    authorize Sock
  end

  def show
    @sock = Sock.find(params[:id])
    @booking = Booking.new(sock: @sock)
    @sock_quantity = @sock.quantity
    authorize @sock
  end

  def new
    @sock = Sock.new
    authorize @sock
  end

  def create
    @sock = Sock.new(sock_params)
    @sock.owner = current_user
    authorize @sock
    if @sock.save
      redirect_to user_path(@sock.owner)
    else
      render :new
    end
  end

  private

  def sock_params
    params.require(:sock).permit(:description, :type_of_socks, :price, :size, :color, :photo, :quantity)
  end
end
