class NotesController < ApplicationController

  def index # to show all if not current_user
    @notes = Note.all
  end

end
