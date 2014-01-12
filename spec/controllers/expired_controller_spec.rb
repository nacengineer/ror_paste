require 'spec_helper'

describe ExpiredController do
  render_views

  let(:pastes) {FactoryGirl.create_list :expired, 10}

  it "should GET the index" do
    paste = pastes.sample
    get :index
    expect(response).to be_success
    expect(assigns(:pastes)).to include paste
  end

end
