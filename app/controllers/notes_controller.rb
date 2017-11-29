class NotesController < ApplicationController

  def index #show all users im following and list of notes
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
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

  def edit; end

  def update; end

  def destroy; end

private

  def notes_params
    params.require(:note).permit(:title, :body)
  end

end
