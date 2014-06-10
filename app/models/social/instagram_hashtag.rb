module Social
  class InstagramHashtag < ActiveRecord::Base
    attr_accessible       :hashtag

    has_many              :photos,
                          :dependent => :destroy

    validates             :hashtag,
                          :presence => true

    after_save            :update_photos

    def photos
      Photo.where('instagram_hashtag_id = ?', self.id)
    end

    def update_photos
      InstagramHashtag.get_hashtag_photos(self.hashtag, self.id)
    end

    def self.get_hashtag_photos(hashtag, id)
    end
  end
end
