class RelationshipController < ApplicationController

  def create # action to follow
    @user = User.find(params[:followee_id])
    @relationship = current_user.follow!(@user)
    flash[:alert] = "You are now following @#{@user.username}"
    redirect_to users_notes_path
  end

  def destroy # action to unfollow
    @user = User.find(params[:id])
    @relationship = current_user.unfollow!(@user)
    flash[:alert] = "You have unfollowed#{@user.username}"
    redirect_to users_notes_path
  end

end
