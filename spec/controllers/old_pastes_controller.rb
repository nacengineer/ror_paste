require 'spec_helper'

describe OldPastesController do

  before do
    @paste = FactoryGirl.create(:old_paste)
  end

  after do
    Paste.delete_all
  end

  it "should GET the index" do
    get pastes_url
    assert_response :success
  end

end
