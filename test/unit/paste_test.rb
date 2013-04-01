require 'test_helper'

class PasteTest < MiniTest::Spec
  describe ".expires_after" do

    before do
      @current_time = Time.now
      @before       = FactoryGirl.create(:paste)
      @at           = FactoryGirl.create(:paste, expire: @current_time)
      @after        = FactoryGirl.create(:paste, expire: 1.day.ago)
    end

    it "returns pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      assert results.include? @before
    end

    it "doesn't return pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      assert !results.include?(@after)
    end

    it "returns pastes at the date and time specified" do
      results = Paste.expires_after(@current_time)
      assert results.include? @at
    end

  end
end
