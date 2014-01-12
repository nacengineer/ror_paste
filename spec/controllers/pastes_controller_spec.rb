require 'spec_helper'

describe PastesController do
  render_views

  let(:pastes) {FactoryGirl.create_list :paste, 10}

  it "should GET the index" do
    paste = pastes.sample
    get :index
    expect(response).to be_success
    expect(assigns(:pastes)).to include paste
  end

  it "should GET the new" do
    get :new
    expect(assigns(:paste)).to be_a_new(Paste)
  end

  it "should CREATE one paste" do
    expect {
      post :create, paste: FactoryGirl.build(:paste)
    }.to change(Paste, :count).by 1
    expect(response).to redirect_to paste_path(assigns(:paste))
  end

  it "should GET the edit" do
    paste = pastes.sample
    get :edit, id: paste.id
    expect(response).to be_success
    expect(assigns(:paste)).to eq paste
  end

  it "should update the paste" do
    paste = pastes.sample
    put :update, id: paste.id, paste: {title: "New Title"}
    expect(assigns(:paste)).to eq paste
    expect(assigns(:paste).title).to eq "New Title"
    expect(response).to redirect_to @paste
  end

  it "should DESTROY one paste" do
    paste = pastes.sample
    expect {
      post :destroy, id: paste.id
    }.to change(Paste, :count).by(-1)
    expect(response).to redirect_to pastes_path
  end

end
