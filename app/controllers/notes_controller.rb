class NotesController < ApplicationController
  before_action :prepare_note, only: [:show, :edit, :update, :destroy]

  def index #show all users im following and list of notes
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      flash["notice"] = "Your note has been created!"
      redirect_to notes_path
    else
      flash["alert"] = "Your note was not saved!"
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(notes_params)
      flash["notice"] = "Your note has been updated!"
      redirect_to notes_path
    else
      flash["alert"] = "Your note was not updated"
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash["notice"] = "Your note has destroyed!"
    redirect_to notes_path
  end

private

  def notes_params
    params.require(:note).permit(:title, :body)
  end

  def prepare_note
    @note = Note.find(params[:id])
  end

end
