require "social/engine"
require "twitter"
require "instagram"

module Social
  mattr_accessor :cache_sweeper
  @@cache_sweeper = false

  mattr_accessor :tweet_store_count
  @@tweet_store_count = 10

  mattr_accessor :twitter_consumer_key
  @@twitter_consumer_key = ''

  mattr_accessor :twitter_consumer_secret
  @@twitter_consumer_secret = ''

  mattr_accessor :twitter_access_token
  @@twitter_access_token = ''

  mattr_accessor :twitter_access_secret
  @@twitter_access_secret = ''

  mattr_accessor :instagram_client_id
  @@instagram_client_id = ''

  mattr_accessor :instagram_client_secret
  @@instagram_client_secret = ''

  class Engine < Rails::Engine
    isolate_namespace Social

    initializer :social do
      ActiveAdmin.application.load_paths.unshift Dir[Social::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
