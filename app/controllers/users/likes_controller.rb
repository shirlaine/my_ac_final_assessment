class Users::LikesController < ApplicationController

  before_action :prepare_user, only: [:create, :destroy]
  before_action :prepare_note, only: [:create, :destroy]


  def create # when click on create, createlike relation with note
    @like = Like.find_or_create_by!(note_id: @note.id, user_id: @user.id)
    redirect_to users_note_path(@note)
  end

  def destroy  # when click on create, destroy like relation with note
    @like = Like.find_by(note_id: @note, user_id: @user)
    @like.destroy
    redirect_to users_note_path(@note)
  end

  private

  def prepare_user
    @user = current_user
  end

  def prepare_note
    @note = Note.find(params[:note_id])
  end

end
