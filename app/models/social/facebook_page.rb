require 'koala'

module Social
  class FacebookPage
    include ActiveModel::Validations

    attr_accessor :url

    validates_presence_of :url

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end

      initialize_graph
    end

    def to_s
      url
    end

    def get_info
      begin
        @graph.get_object(self.url)
      rescue Exception => e
        Rails.logger.error("Facebook API error: #{e}")
        false
      end
    end

    private
    def initialize_graph
      if defined? Social.config.facebook_oauth_token
        @graph ||= Koala::Facebook::API.new Social.config.facebook_oauth_token
      else
        @graph ||= Koala::Facebook::API.new
      end
    end
  end
end
