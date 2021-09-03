class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @socks = Sock.where(owner: current_user)
  end

  def index
    @users = User.all

   # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })

      }
    end
  end
end
