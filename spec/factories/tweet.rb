FactoryGirl.define do
  factory :tweet, class: Social::Tweet do
    text "Hello, World!"
    twitter_user_id 1
    tweeted_at '2013-01-01 01:01:01'
    tweet_id 1001
  end
end
