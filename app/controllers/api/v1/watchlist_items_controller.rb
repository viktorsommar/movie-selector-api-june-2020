class Api::V1::WatchlistItemsController < ApplicationController
  before_action :authenticate_user!

  def create
     
      if current_user.watchlist.nil?
        watchlist = Watchlist.create(user_id: current_user.id)
      else
        watchlist = current_user.watchlist
      end
    
    watchlist.watchlist_items.create(title: params["title"], movie_db_id: params["movie_db_id"])
    render json: { message: 'The movie has been added to your watchlist'}
  end
end
