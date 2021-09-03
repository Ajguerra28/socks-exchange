class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @socks = Sock.where(owner: current_user)
    @markers = @user.geocode.map do |user|
      {
        lat: 12,
        lng: 32,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  def index
    @users = User.all

   # the `geocoded` scope filters only flats with coordinates (latitude & longitude)

  end
end
