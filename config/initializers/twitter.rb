Twitter.configure do |config|
  config.consumer_key = Social.config.twitter_consumer_key
  config.consumer_secret = Social.config.twitter_consumer_secret
end
