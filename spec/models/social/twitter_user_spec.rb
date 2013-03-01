require 'spec_helper'

module Social
  describe TwitterUser do
    include Helpers

    before(:each) do
      stub_twitter_api
      @twitter_user = FactoryGirl.create(:twitter_user)
    end

    it "has a valid factory" do
      @twitter_user.should be_valid
    end

    it "is invalid without a username" do
      FactoryGirl.build(:twitter_user, username: nil).should_not be_valid
    end

    it "is invalid with a username of fewer than 3 characters" do
      FactoryGirl.build(:twitter_user, username: "ab").should_not be_valid
    end

    it "should fetch the latest 10 tweets for the user when it's created" do
      @twitter_user.tweets.length.should eq 10
    end

    it "should expose the tweets associated with the user" do
      @twitter_user.tweets[0].text.should eq "A nice set of map icons here by @MapBox http://t.co/KKySnrvc would go well with http://t.co/tNidUnVw"
    end
  end
end
