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

  describe 'GET #new' do

    before { get :new, params: { user_id: user1 } }

    it { expect(assigns(:note)).to be_a_new(Note) }

  end

  describe 'GET #edit' do

    let!(:note_1) { create(:note, user: user1) }

    before { get :edit, params: { user_id: user1, id: note_1 } }

    it { expect(assigns(:note)).to eq(note_1) }

  end

  describe 'POST #create' do

    before do
      post :create, params: {
        user_id: user1,
        note: note_attributes
      }
    end

    context 'when save is successful' do

      let(:note_attributes) { attributes_for(:note) }
      let(:note_1) { create(:note) }

      it { expect(Note.count).to eq(1) }
      it { expect(subject).to redirect_to(users_notes_path) }

    end

    context 'when save is unsuccessful' do

      let(:note_attributes) { attributes_for(:note, title: nil) }

      it { expect(subject).to render_template(:new) }

    end

  end



end
