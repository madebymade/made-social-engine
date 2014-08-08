module Social
  class InstagramHashtag < ActiveRecord::Base
    attr_accessible       :hashtag

    has_many              :photos,
                          :dependent => :destroy,
                          :class_name => "Social::InstagramPhoto"

    validates             :hashtag,
                          :presence => true,
                          :uniqueness => true

    after_save            :update_photos

    def update_photos
      InstagramPhoto.get_hashtag_photos(self)
    end

    def self.refresh_hashtag_photos
      InstagramHashtag.all.each do |instagram_hashtag|
        InstagramPhoto.get_hashtag_photos(instagram_hashtag)
      end
    end

    def to_s
      self.hashtag
    end
  end
end
