require 'test_helper'

describe "Pastes Urls" do
  class PastesControllerTest < ActionDispatch::IntegrationTest

    before do
      @paste = FactoryGirl.create(:paste)
    end

    after do
      Paste.delete_all
    end

    it "should GET the archives index" do
      get pastes_url
      assert_response :success
    end

  end
end
