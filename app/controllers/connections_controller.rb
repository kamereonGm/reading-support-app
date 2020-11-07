class ConnectionsController < ApplicationController
  def timeline
    @posts = Shelf.where(user_id: @current_user.id,status: true)
  end
end
