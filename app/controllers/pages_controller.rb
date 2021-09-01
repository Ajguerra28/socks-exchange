class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @socks = Sock.last(6)
  end
end
