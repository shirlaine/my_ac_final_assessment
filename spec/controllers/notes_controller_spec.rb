require 'rails_helper'

RSpec.describe Users::NotesController, type: :controller do

  let(:user1) { create(:user) }

  before { sign_in user1 }

  describe "GET #index" do
    let!(:note_1) { create(:note, user: user1) }

    before do
      get :index
    end

    it { expect(assigns(:notes).count).to eq(1) }
    # it { expect(assigns(:notes)).to eq(note_1) }
    # it { expect(Note.count).to eq(1)}
  end

  describe "GET #show" do

    let!(:note_1) { create(:note) }

     before { get :show, params: { id: note_1.id } }

    it { expect(assigns(:note)).to eq(note_1) }
  end


end
