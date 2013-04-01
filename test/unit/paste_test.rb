require 'test_helper'

class PasteTest < MiniTest::Spec
  describe ".expires_after" do

    before do
      @current_time = Time.now
      @before       = FactoryGirl.create(:paste)
      @at           = FactoryGirl.create(:paste, expire: @current_time)
      @old          = FactoryGirl.create(:old_paste)
    end

    it "returns pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@before).must_equal true
    end

    it "doesn't return pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@old).must_equal false
    end

    it "returns pastes at the date and time specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@at).must_equal true
    end

  end
end
