class Users::LikesController < ApplicationController

  def create # when click on create, createlike relation with note
    @user = current_user
    @note = Note.find(params[:note_id])
    @like = Like.find_or_create_by!(note_id: @note.id, user_id: @user.id)
    redirect_to users_note_path(@note)
  end

  def destroy  # when click on create, destroy like relation with note
    @user = current_user
    @note = Note.find(params[:note_id])
    @like = Like.find_by(note_id: @note, user_id: @user)
    @like.destroy
    redirect_to users_note_path(@note)
  end

end
