class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @socks = Sock.where(owner: current_user)
  end
end
