require 'test_helper'

describe "Old Pastes Urls" do
  class OldPastesControllerTest < ActionDispatch::IntegrationTest

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
end
