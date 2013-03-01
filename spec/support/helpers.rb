require 'factory_girl'
FactoryGirl.find_definitions

module Helpers
  def fixture(file)
    File.new(File.join(File.dirname(__FILE__), '../fixtures/', file))
  end

  def stub_twitter_api
    stub_request(:get, "https://api.twitter.com/1.1/account/rate_limit_status.json").
      to_return(:status => 200, :body => fixture("twitter_rate_limit.json"), :headers => {})

    stub_request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=madebymade").
      to_return(:status => 200, :body => fixture("twitter_tweets.json"), :headers => {})
  end
end
