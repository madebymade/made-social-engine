require 'spec_helper'

module Social
  describe Tweet do
    include Helpers

    before(:each) do
      stub_twitter_api
      @tweet = FactoryGirl.create(:tweet)
    end

    it "has a valid factory" do
      @tweet.should be_valid
    end

    it "is invalid without text" do
      FactoryGirl.build(:tweet, text: nil).should_not be_valid
    end

    it "is invalid without tweet ID" do
      FactoryGirl.build(:tweet, tweet_id: nil).should_not be_valid
    end

    it "is invalid without a tweeted at date" do
      FactoryGirl.build(:tweet, tweeted_at: nil).should_not be_valid
    end

    it "is invalid without Twitter user ID" do
      FactoryGirl.build(:tweet, twitter_user_id: nil).should_not be_valid
    end

    it "should fetch the tweets for a Twitter user" do
      Tweet.fetch_tweets('madebymade', 1)
      Tweet.where(:twitter_user_id => 1).count.should eq 10
    end
  end
end
