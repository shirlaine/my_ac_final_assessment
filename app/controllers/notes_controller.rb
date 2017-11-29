class NotesController < ApplicationController

  def index #show all users im following and list of notes
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

private

  def notes_params

  end

end
