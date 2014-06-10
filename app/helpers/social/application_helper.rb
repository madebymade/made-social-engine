require 'twitter-text'

module Social
  module ApplicationHelper
    include Twitter::Autolink

    def latest_tweets(username, number = 10)
      user = Social::TwitterUser.find_by_username(username)

      return if user.blank?

      render :partial => "social/tweet_list", :locals => { :user => user, :number => number }
    end
  end
end
