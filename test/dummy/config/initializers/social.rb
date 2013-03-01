Social.config do |config|
  # Set this to false to disable cache sweeping, or to a symbol representing the
  # cache sweeping class to have this invoked every time a competition is changed.
  config.cache_sweeper = false

  # Number of tweets to store per user
  config.tweet_store_count = 10
end
