require 'spec_helper'

describe Paste do

  describe ".expires_after" do
    before do
      @current_time = Time.now
      @before       = FactoryGirl.create(:paste)
      @at           = FactoryGirl.create(:paste, expire: @current_time)
      @old          = FactoryGirl.create(:expired)
    end

    after {Paste.delete_all}

    it "returns pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@before).should eq true
    end

    it "doesn't return pastes before the date specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@old).should eq false
    end

    it "returns pastes at the date and time specified" do
      results = Paste.expires_after(@current_time)
      results.include?(@at).should eq true
    end
  end

  describe "Paste General" do
    before {@paste = FactoryGirl.build(:paste)}
    after {Paste.delete_all}

    it "is valid" do
      @paste.valid?.should eq true
    end

    it "saves" do
      @paste.save.should eq true
    end

    it "destroys" do
      @paste.destroy.should eq @paste
    end

    it "read_title works" do
      paste = FactoryGirl.create(:paste, title: '')
      paste.read_title.present?.should eq true
      paste.read_title.should eq(paste.paste[0..96] << '...')
    end
  end

end
