module Social
  class TwitterUser < ActiveRecord::Base
    attr_accessible           :username

    has_many                  :tweets,
                              :dependent => :destroy

    validates                 :username,
                              :presence => true,
                              :length => { :minimum => 3 }

    after_save                :get_tweets_and_user_info

    def to_s
      username
    end

    def tweets
      Tweet.where('twitter_user_id = ? ', self.id)
    end

    def get_tweets_and_user_info
      TwitterUser.get_additional_meta(self)
      TwitterUser.get_user_tweets(self.username, self.id)
    end

    def self.get_user_tweets(username, id)
      Tweet.fetch_tweets(username, id)
    end

    def self.get_additional_meta(user)
      client = Twitter::Client.new(
        :consumer_key => Social.config.twitter_consumer_key,
        :consumer_secret => Social.config.twitter_consumer_secret,
        :oauth_token => Social.config.twitter_access_token,
        :oauth_token_secret => Social.config.twitter_access_secret
      )
      user_twitter_profile = client.user(user.username)

      user.update_column(:display_name, user_twitter_profile.name)
      user.update_column(:avatar_url, user_twitter_profile.profile_image_url)
    end

    def self.get_all_tweets
      TwitterUser.all.each do |twitter_user|
        twitter_user.get_tweets_and_user_info
      end
    end
  end
end
