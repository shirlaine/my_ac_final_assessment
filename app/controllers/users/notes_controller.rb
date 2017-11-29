class Users::NotesController < ApplicationController

  before_action :prepare_note, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index # show all users im following and list of notes
    @notes = current_user.notes
    @feed = Note.where(user_id: current_user.leaders.ids)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(notes_params)
    if @note.save
      flash['notice'] = 'Your note has been created!'
      redirect_to users_notes_path
    else
      flash['alert'] = 'Your note was not saved!'
      render :new
    end
  end

  def edit; end

  def update
    if @note.update(notes_params)
      flash['notice'] = 'Your note has been updated!'
      redirect_to users_notes_path
    else
      flash['alert'] = 'Your note was not updated'
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash['notice'] = 'Your note has been destroyed!'
    redirect_to users_notes_path
  end

  private

  def notes_params
    params.require(:note).permit(:title, :body)
  end

  def prepare_note
    @note = current_user.notes.find(params[:id])
  end

end
