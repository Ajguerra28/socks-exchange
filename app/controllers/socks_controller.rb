class SocksController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @socks = Sock.all
  end

  def show
    @sock = Sock.find(params[:id])
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
