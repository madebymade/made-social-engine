require 'twitter'

module Social
  class Tweet < ActiveRecord::Base
    attr_accessible           :text, :twitter_user_id, :tweeted_at, :tweet_id

    belongs_to                :twitter_user

    validates                 :text,
                              :presence => true
    validates                 :tweet_id,
                              :presence => true
    validates                 :tweeted_at,
                              :presence => true
    validates                 :twitter_user_id,
                              :presence => true

    default_scope             :order => 'tweeted_at DESC'

    def to_s
      text
    end

    def self.fetch_tweets(username, user_id)
      Twitter.user_timeline(username).each do |tweet|
        begin
          tweet_obj = Tweet.where(:text => tweet.text,
                                  :tweeted_at => tweet.created_at,
                                  :twitter_user_id => user_id,
                                  :tweet_id => tweet.id
                                  ).first_or_create
          delete_old_tweets(user_id)
        rescue Twitter::Error::TooManyRequests
          raise "Twitter API limit exceeded"
        end
      end
    end

    def self.delete_old_tweets(user_id)
      Tweet.where('twitter_user_id = ? ', user_id).offset(Social.config.tweet_store_count)
        .each { |tweet| tweet.delete }
    end
  end
end
