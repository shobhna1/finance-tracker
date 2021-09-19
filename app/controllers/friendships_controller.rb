class FriendshipsController < ApplicationController
  def create
    newfriend = User.find(params[:id])
    if (newfriend)
      @newfriend = Friendship.create(user_id: current_user.id, friend_id: newfriend.id)
      flash[:notice] = "Now following #{newfriend.full_name}"
      redirect_to my_friends_path
    else
      flash[:alert] = "No friend found"
      redirect_to my_friends_path
    end
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
