module Social
  class InstagramHashtag < ActiveRecord::Base
    attr_accessible       :hashtag

    has_many              :photos,
                          :dependent => :destroy

    validates             :hashtag,
                          :presence => true

    after_save            :update_photos


  end
end
