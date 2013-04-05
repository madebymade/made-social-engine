module Social
  class TwitterUser < ActiveRecord::Base
    attr_accessible           :username

    has_many                  :tweets,
                              :dependent => :destroy

    validates                 :username,
                              :presence => true,
                              :length => { :minimum => 3 }

    after_save                :update_tweets

    def to_s
      username
    end

    def tweets
      Tweet.where('twitter_user_id = ? ', self.id)
    end

    def update_tweets
      TwitterUser.get_user_tweets(self.username, self.id)
    end

    def self.get_user_tweets(username, id)
      Tweet.fetch_tweets(username, id)
    end

    def self.get_all_tweets
      TwitterUser.all.each do |twitter_user|
        TwitterUser.get_user_tweets(twitter_user.username, twitter_user.id)
      end
    end
  end
end
