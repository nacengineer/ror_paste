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

  describe "Paste General" do

    before {@paste = FactoryGirl.build(:paste)}

    it "is valid" do
      @paste.valid?.must_equal true
    end

    it "saves" do
      @paste.save.must_equal true
    end

    it "destroys" do
      @paste.destroy.must_equal @paste
    end

    it "read_title works" do
      paste = FactoryGirl.create(:paste, title: '')
      paste.read_title.present?.must_equal true
      paste.read_title.must_equal paste.paste[0..96] << '...'
    end

  end
end
