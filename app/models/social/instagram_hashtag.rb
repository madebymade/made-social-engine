module Social
  class InstagramHashtag < ActiveRecord::Base
    attr_accessible       :hashtag

    has_many              :photos,
                          :dependent => :destroy

    validates             :hashtag,
                          :presence => true

    after_save            :update_photos

    def photos
      InstagramPhoto.where('instagram_hashtag_id = ?', self.id)
    end

    def update_photos
      InstagramPhoto.get_hashtag_photos(self.hashtag, self.id)
    end

    def self.refresh_hashtag_photos
      InstagramHashtag.all.each do |instagram_hashtag|
        InstagramPhoto.get_hashtag_photos(instagram_hashtag.hashtag, instagram_hashtag.id)
      end
    end
  end
end
