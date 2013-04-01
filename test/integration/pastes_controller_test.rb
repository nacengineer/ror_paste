require 'test_helper'

describe "Pastes Urls" do
  class PastesControllerTest < ActionDispatch::IntegrationTest

    before do
      @paste = FactoryGirl.create(:paste)
    end

    after do
      Paste.delete_all
    end

    it "should GET the index" do
      get pastes_url
      assert_response :success
    end

    it "should GET the new" do
      get new_paste_url
      assert_response :success
    end

    it "should CREATE one paste" do
      assert_difference('Paste.count') do
        post pastes_url(paste: FactoryGirl.build(:paste))
      end
      assert_redirected_to paste_path(assigns(:paste))
    end

    it "should GET the edit" do
      get edit_paste_url(@paste)
      assert_response :success
    end

    it "should update the paste" do
      @paste.title = "New Title"
      put paste_url(id: @paste)
      assert_redirected_to paste_path(assigns(:paste))
      assert @paste.title.must_equal "New Title"
    end

    it "should DESTROY one paste" do
      assert_difference('Paste.count', -1) do
        delete paste_url(@paste)
      end
      assert_redirected_to pastes_path
    end

  end
end
