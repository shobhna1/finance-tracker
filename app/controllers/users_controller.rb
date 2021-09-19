class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friend_list = current_user.friends
  end

  def search
    render json: params[:friend]
  end

end
