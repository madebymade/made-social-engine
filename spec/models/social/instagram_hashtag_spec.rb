require 'spec_helper'

module Social
  describe InstagramHashtag do
    include Helpers

    before(:each) do
      stub_instagram_api
      @instagram_hashtag = FactoryGirl.create(:instagram_hashtag)
    end

    it "has a valid factory" do
      expect(@instagram_hashtag).to be_valid
    end

    it "is invalid with a hashtag" do
      expect(FactoryGirl.build(:instagram_hashtag, hashtag: nil)).to_not be_valid
    end

    it "should fetch 20 photos relevant to the hashtag when it's created" do
      expect(@instagram_hashtag.photos.length).to eq 20
    end
  end
end
